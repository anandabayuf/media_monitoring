import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:web_media_monitoring/Services/apiService.dart';
import 'package:web_media_monitoring/views/operator/input%20manual/widget/DialogSuccesInputManual.dart';
import 'package:web_media_monitoring/views/operator/input%20rss/widget/DialogSuccesInputRss.dart';

class NewsController {
  BuildContext context;
  NewsController(this.context);
  RestClient api = RestClient(Dio());
  void inputManual(
      String category,
      String date,
      String title,
      String writer,
      String content,
      String link,
      String publisher,
      String media,
      String deviceID,
      String token) async {
    await api
        .manualInput(category, date, title, writer, content, link, publisher,
            media, deviceID, token)
        .then((response) {
      if (response.status == 1) {
        showDialog<String>(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) =>
                DialogSuccessInputManual(context));
      } else {
        Fluttertoast.showToast(msg: "input gagal, Silahkan ulangi");
      }
    }).catchError((e) {
      print(e);
      Fluttertoast.showToast(
          msg: "Terjadi Kesalahan, silahkan coba lagi setelah beberapa saat");
    });
  }

 
}
