import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_media_monitoring/Controller/searchController.dart';
import 'package:web_media_monitoring/model/publisherListTile.dart';

import 'package:web_media_monitoring/model/publisherModel.dart';

import '../chart.dart';

late String keyword = "";
late String token = "";
late String deviceId = "";

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  late SearchController _searchController = new SearchController();

  @override
  Widget build(BuildContext context) {
    fill();
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: SimpleBarChart.withSampleData()),
          Expanded(
            child: FutureBuilder(
              future: _searchController.getPublisher(keyword, token, deviceId),
              builder: (BuildContext context,
                  AsyncSnapshot<List<PublisherModel>> snapshot) {
                if (snapshot.hasData) {
                  List<PublisherModel>? articles = snapshot.data;
                  return ListView.builder(
                      itemCount: articles!.length,
                      itemBuilder: (context, index) {
                        return publisherListTile(articles[index], context);
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
  // token = (prefs.getString("api_token"))!;
  token = "bisa";
  // deviceId = prefs.getString("deviceID")!;
  deviceId = "jadi";
  keyword = prefs.getString("keyword")!;
}
