import 'package:charts_flutter/flutter.dart';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_media_monitoring/Controller/searchController.dart';
import 'package:web_media_monitoring/model/newsChartModel.dart';
import 'package:web_media_monitoring/model/publisherListTile.dart';

import 'package:web_media_monitoring/model/publisherModel.dart';
import 'package:web_media_monitoring/newsChart.dart';

String keyword = "";
String token = "";
String deviceId = "";
String firstDate = "";
String lastDate = "";

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  late SearchController _searchController = new SearchController();

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    DateTime sevenDaysAgo = now.subtract(Duration(days: 7));

    firstDate = DateFormat('yyyy-mm-dd').format(now);
    lastDate = DateFormat('yyyy-mm-dd').format(sevenDaysAgo);
    fill();
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: FutureBuilder(
                  future: _searchController.getNewsChartData(
                      keyword, firstDate, lastDate, token, deviceId),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<NewsChartModel>> snapshot) {
                    if (snapshot.hasData) {
                      List<NewsChartModel>? articles = snapshot.data;
                      return ListView.builder(
                          itemCount: articles!.length,
                          itemBuilder: (context, index) {
                            return NewsChart(articles);
                          });
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  })),
          Expanded(
            child: FutureBuilder(
              future: _searchController.getPublisher(keyword, token, deviceId),
              builder: (BuildContext context,
                  AsyncSnapshot<List<PublisherModel>> snapshot) {
                if (snapshot.hasData) {
                  List<PublisherModel>? news = snapshot.data;
                  return ListView.builder(
                      itemCount: news!.length,
                      itemBuilder: (context, index) {
                        return publisherListTile(news[index], context);
                      });
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

Future<void> fill() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  token = prefs.getString("api_token")!;
  // token = "bisa";
  deviceId = prefs.getString("deviceID")!;
  // deviceId = "jadi";
  keyword = prefs.getString("keyword")!;
}
