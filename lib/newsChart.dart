import 'package:flutter/material.dart';
import 'package:web_media_monitoring/model/newsChartModel.dart';
import 'package:charts_flutter/flutter.dart' as charts;

Widget newsChartTile(BuildContext context, AsyncSnapshot asc) {
  List<NewsChartModel> newsChart = asc.data;

  List<NewsChartModel> dataNews = <NewsChartModel>[
    NewsChartModel(newsChart[0].date, newsChart[0].total),
    NewsChartModel(newsChart[1].date, newsChart[1].total),
    NewsChartModel(newsChart[2].date, newsChart[2].total),
    NewsChartModel(newsChart[3].date, newsChart[3].total),
    NewsChartModel(newsChart[4].date, newsChart[4].total),
    NewsChartModel(newsChart[5].date, newsChart[5].total),
    NewsChartModel(newsChart[6].date, newsChart[6].total),
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
