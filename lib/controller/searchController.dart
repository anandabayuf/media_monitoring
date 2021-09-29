import 'package:dio/dio.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_media_monitoring/model/newsChartModel.dart';

import 'package:web_media_monitoring/model/publisherModel.dart';
import 'package:web_media_monitoring/model/tokenModel.dart';
import 'package:web_media_monitoring/services/apiService.dart';

class SearchController extends GetxController {
  RestClient api = RestClient(Dio());
  List<PublisherModel> publisher = <PublisherModel>[];
  List<NewsChartModel> news = <NewsChartModel>[];

  Future<List<PublisherModel>> getPublisher(
      String keyword, String token, String deviceID) async {
    await api.publisher(keyword, token, deviceID).then((response) {
      int status = response.status;
      if (status == 1) {
        var temps = response.data;
        for (var t in temps) {
          publisher.add(PublisherModel.fromJson(t));
        }
      } else {
        api.auth(token, deviceID).then((response) async {
          TokenModel token = TokenModel.fromJson(response.data);
          String newToken = token.token;
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString("api_token", newToken);
          getPublisher(keyword, newToken, deviceID);
        });
      }
    });
    return publisher;
  }

  Future<List<NewsChartModel>> getNewsChartData(String keyword,
      String firstDate, String lastDate, String token, String deviceID) async {
    await api
        .getDataChart(keyword, firstDate, lastDate, token, deviceID)
        .then((response) {
      int status = response.status;
      if (status == 1) {
        var temps = response.data;
        for (var t in temps) {
          news.add(NewsChartModel.fromJson(t));
        }
      } else {
        api.auth(token, deviceID).then((response) async {
          TokenModel token = TokenModel.fromJson(response.data);
          String newToken = token.token;
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString("api_token", newToken);
          getNewsChartData(keyword, firstDate, lastDate, newToken, deviceID);
        });
      }
    });
    return news;
  }

  Future<List<NewsChartModel>> getChart(String keyword) async {
    String firstDate;
    String lastDate;
    String token;
    String deviceId;
    DateTime now = DateTime.now();
    DateTime sevenDaysAgo = now.subtract(Duration(days: 6));
    firstDate = DateFormat('yyyy-mm-dd').format(now);
    lastDate = DateFormat('yyyy-mm-dd').format(sevenDaysAgo);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = "Bearer ${prefs.getString("api_token") ?? "undifined"}";
    deviceId = prefs.getString("DeviceID") ?? "undifined";

    return getNewsChartData(keyword, firstDate, lastDate, token, deviceId);
  }

  Future<List<PublisherModel>> getListPublisher(String keyword) async {
    String token;
    String deviceId;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = "Bearer ${prefs.getString("api_token") ?? "undifined"}";
    deviceId = prefs.getString("DeviceID") ?? "undifined";

    return getPublisher(keyword, token, deviceId);
  }
}
