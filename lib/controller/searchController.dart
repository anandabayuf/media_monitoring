import 'package:dio/dio.dart';

import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_media_monitoring/model/newsChartModel.dart';

import 'package:web_media_monitoring/model/publisherModel.dart';
import 'package:web_media_monitoring/model/tokenModel.dart';
import 'package:web_media_monitoring/services/apiService.dart';

class SearchController {
  RestClient api = RestClient(Dio());
  List<PublisherModel> publisher = <PublisherModel>[];
  List<NewsChartModel> news = <NewsChartModel>[];

  Future<List<PublisherModel>> getPublisher(
      String keyword, String token, String deviceID) async {
    await api.publisher(keyword, token, deviceID).then((response) async {
      int status = response.status;
      if (status == 1) {
        var temps = response.data;
        for (var t in temps) {
          publisher.add(PublisherModel.fromJson(t));
        }
      } else {
        await api.auth(token, deviceID).then((response) async {
          int status = response.status;
          if (status == 1) {
            TokenModel token = TokenModel.fromJson(response.data);
            String newToken = token.token;
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setString("api_token", newToken);
            getPublisher(keyword, newToken, deviceID);
          }
        });
      }
    });
    return publisher;
  }

  Future<List<NewsChartModel>> getNewsChartData(String keyword,
      String firstDate, String lastDate, String token, String deviceID) async {
    await api
        .getDataChart(keyword, firstDate, lastDate, token, deviceID)
        .then((response) async {
      int status = response.status;
      if (status == 1) {
        var temps = response.data;
        for (var t in temps) {
          news.add(NewsChartModel.fromJson(t));
        }
      } else {
        await api.auth(token, deviceID).then((response) async {
          int status = response.status;
          if (status == 1) {
            TokenModel token = TokenModel.fromJson(response.data);
            String newToken = token.token;
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setString("api_token", newToken);
            getNewsChartData(keyword, firstDate, lastDate, newToken, deviceID);
          }
        });
      }
    });
    return news;
  }

  Future<List<NewsChartModel>> getChart() async {
    String firstDate;
    String lastDate;
    String token;
    String deviceId;
    String keyword;
    DateTime now = DateTime.now();
    DateTime sevenDaysAgo = now.subtract(Duration(days: 6));
    firstDate = DateFormat('yyyy-mm-dd').format(now);
    lastDate = DateFormat('yyyy-mm-dd').format(sevenDaysAgo);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = "Bearer ${prefs.getString("api_token") ?? "undifined"}";
    deviceId = prefs.getString("deviceID") ?? "undifined";
    keyword = prefs.getString("keyword") ?? "undifined";

    return getNewsChartData(keyword, firstDate, lastDate, token, deviceId);
  }

  Future<List<PublisherModel>> getListPublisher() async {
    String keyword;
    String token;
    String deviceId;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = "Bearer ${prefs.getString("api_token") ?? "undefined"}";
    deviceId = prefs.getString("deviceID") ?? "undefined";
    keyword = prefs.getString("keyword") ?? "undefined";

    return getPublisher(keyword, token, deviceId);
  }
}
