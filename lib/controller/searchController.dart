import 'package:dio/dio.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:web_media_monitoring/model/publisherModel.dart';
import 'package:web_media_monitoring/model/tokenModel.dart';
import 'package:web_media_monitoring/services/apiService.dart';

class SearchController extends GetxController {
  RestClient api = RestClient(Dio());
  List<PublisherModel> news = <PublisherModel>[].obs;

  Future<List<PublisherModel>> getPublisher(
      String keyword, String token, String deviceID) async {
    await api.publisher(keyword, token, deviceID).then((response) {
      int status = response.status;
      if (status == 1) {
        var temps = response.data;
        for (var t in temps) {
          news.add(PublisherModel.fromJson(t));
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
    return news;
  }
}
