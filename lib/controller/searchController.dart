import 'package:dio/dio.dart';
import 'package:web_media_monitoring/model/newsModel.dart';
import 'package:web_media_monitoring/services/apiService.dart';

class SearchController {
  RestClient api = RestClient(Dio());
  List<NewsModel> news = [];
  // @override
  Future<List<NewsModel>> search(
      String keyword, String token, String deviceID) async {
    await api.search(keyword, token, deviceID).then((response) {
      int status = response.status;
      if (status == 1) {
        var temps = response.data;
        for (var t in temps) {
          news.add(NewsModel.fromJson(t));
        }
      }
    });
    return news;
  }
}
