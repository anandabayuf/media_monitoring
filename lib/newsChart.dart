import 'package:flutter/material.dart';
import 'package:web_media_monitoring/model/newsChartModel.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class NewsChart extends StatefulWidget {
  List<NewsChartModel> chart;
  NewsChart(this.chart);

  @override
  _NewsChartState createState() => _NewsChartState(this.chart);
}

class _NewsChartState extends State<NewsChart> {
  List<NewsChartModel> news;
  _NewsChartState(this.news);
  @override
  Widget build(BuildContext context) {
    List<NewsChartModel> dataNews = <NewsChartModel>[
      NewsChartModel(news[0].date, news[0].total),
      NewsChartModel(news[1].date, news[1].total),
      NewsChartModel(news[2].date, news[2].total),
      NewsChartModel(news[3].date, news[3].total),
      NewsChartModel(news[4].date, news[4].total),
      NewsChartModel(news[5].date, news[5].total),
      NewsChartModel(news[6].date, news[6].total),
    ];

    List<charts.Series<NewsChartModel, String>> chart = [
      charts.Series(
        id: "Total",
        data: dataNews,
        domainFn: (NewsChartModel news, _) => news.date,
        measureFn: (NewsChartModel news, _) => news.total,
      )
    ];

    return charts.BarChart(
      chart,
      animate: true,
    );
  }
}
