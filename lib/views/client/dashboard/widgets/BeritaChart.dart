/// Bar chart example
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:web_media_monitoring/model/newsChartModel.dart';

class BeritaChart extends StatelessWidget {
  AsyncSnapshot snapshot;
  BuildContext context;

  final bool animate;
  final String keyword;

  BeritaChart(this.snapshot, this.context,
      {required this.animate, required this.keyword});

  /// Creates a [BarChart] with sample data and no transition.
  // factory BeritaChart.withSampleData(String keyword) {
  //   return new BeritaChart(
  //     _createSampleData(),
  //     // Disable animations for image tests.
  //     animate: true,
  //     keyword: keyword
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    List<NewsChartModel> newsChart = snapshot.data;

    /// Create one series with sample hard coded data.
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
    return new charts.BarChart(
      chart,
      animate: animate,
      animationDuration: Duration(milliseconds: 600),
      domainAxis: new charts.OrdinalAxisSpec(
          renderSpec: new charts.SmallTickRendererSpec(
              // Tick and Label styling here.
              labelStyle: new charts.TextStyleSpec(
                  fontSize: 10, // size in Pts.
                  color: charts.Color.fromHex(code: "#707070")),
              // Change the line colors to match text color.
              lineStyle: new charts.LineStyleSpec(
                  color: charts.Color.fromHex(code: "#707070")))),

      /// Assign a custom style for the measure axis.
      primaryMeasureAxis: new charts.NumericAxisSpec(
          renderSpec: new charts.GridlineRendererSpec(
              // Tick and Label styling here.
              labelStyle: new charts.TextStyleSpec(
                  fontSize: 10, // size in Pts.
                  color: charts.Color.fromHex(code: "#707070")),
              // Change the line colors to match text color.
              lineStyle: new charts.LineStyleSpec(
                  color: charts.Color.fromHex(code: "#707070")))),
      behaviors: [
        charts.ChartTitle(
            "Grafik jumlah berita yang mengandung \n\"${this.keyword}\"",
            behaviorPosition: charts.BehaviorPosition.top,
            titleOutsideJustification: charts.OutsideJustification.start,
            innerPadding: 18,
            titleStyleSpec: charts.TextStyleSpec(
              color: charts.Color.white,
              fontSize: 12,
            )),
        charts.ChartTitle("Jumlah",
            behaviorPosition: charts.BehaviorPosition.start,
            titleOutsideJustification: charts.OutsideJustification.middle,
            titleStyleSpec: charts.TextStyleSpec(
              color: charts.Color.white,
              fontSize: 10,
            )),
        charts.ChartTitle("Tanggal",
            behaviorPosition: charts.BehaviorPosition.bottom,
            titleOutsideJustification: charts.OutsideJustification.middle,
            titleStyleSpec: charts.TextStyleSpec(
              color: charts.Color.white,
              fontSize: 10,
            )),
      ],
    );
  }
}
