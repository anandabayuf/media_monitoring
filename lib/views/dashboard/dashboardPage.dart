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

late SearchController _searchController = new SearchController();

class DashboardPage extends StatefulWidget {
  String keyword;
  DashboardPage(this.keyword);
  @override
  _DashboardPageState createState() => _DashboardPageState(this.keyword);
}

class _DashboardPageState extends State<DashboardPage> {
  String keyword;
  _DashboardPageState(this.keyword);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: FutureBuilder(
                  future: _searchController.getChart(keyword),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<NewsChartModel>> snapshot) {
                    if (snapshot.hasData) {
                      return newsChartTile(context, snapshot);
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  })),
          Expanded(
            child: FutureBuilder(
              future: _searchController.getListPublisher(keyword),
              builder: (BuildContext context,
                  AsyncSnapshot<List<PublisherModel>> snapshot) {
                if (snapshot.hasData) {
                  return publisherListTile(snapshot, context);
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
