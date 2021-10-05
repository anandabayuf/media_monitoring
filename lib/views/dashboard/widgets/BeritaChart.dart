/// Bar chart example
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class BeritaChart extends StatelessWidget {
  final List<charts.Series<dynamic, String>> seriesList;
  final bool animate;
  final String keyword;

  BeritaChart(this.seriesList, {required this.animate, required this.keyword});

  /// Creates a [BarChart] with sample data and no transition.
  factory BeritaChart.withSampleData(String keyword) {
    return new BeritaChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: true,
      keyword: keyword
    );
  }


  @override
  Widget build(BuildContext context) {
    return new charts.BarChart(
      seriesList,
      animate: animate,
      animationDuration: Duration(milliseconds: 600),
      domainAxis: new charts.OrdinalAxisSpec(
        renderSpec: new charts.SmallTickRendererSpec(
          // Tick and Label styling here.
          labelStyle: new charts.TextStyleSpec(
            fontSize: 10, // size in Pts.
            color: charts.Color.fromHex(code: "#707070")
          ),
          // Change the line colors to match text color.
          lineStyle: new charts.LineStyleSpec(
            color: charts.Color.fromHex(code: "#707070")
          )
        )
      ),
      /// Assign a custom style for the measure axis.
      primaryMeasureAxis: new charts.NumericAxisSpec(
        renderSpec: new charts.GridlineRendererSpec(
          // Tick and Label styling here.
          labelStyle: new charts.TextStyleSpec(
            fontSize: 10, // size in Pts.
            color: charts.Color.fromHex(code: "#707070")
          ),
          // Change the line colors to match text color.
          lineStyle: new charts.LineStyleSpec(
            color: charts.Color.fromHex(code: "#707070")
          )
        )
      ),
      behaviors: [
        charts.ChartTitle(
          "Grafik jumlah berita yang mengandung \n\"${this.keyword}\"",
          behaviorPosition: charts.BehaviorPosition.top,
          titleOutsideJustification: charts.OutsideJustification.start,
          innerPadding: 18,
          titleStyleSpec: charts.TextStyleSpec(
            color: charts.Color.white,
            fontSize: 12,
          )
        ),
        charts.ChartTitle(
          "Jumlah",
          behaviorPosition: charts.BehaviorPosition.start,
          titleOutsideJustification: charts.OutsideJustification.middle,
          titleStyleSpec: charts.TextStyleSpec(
            color: charts.Color.white,
            fontSize: 10,
          )
        ),
        charts.ChartTitle(
            "Tanggal",
            behaviorPosition: charts.BehaviorPosition.bottom,
            titleOutsideJustification: charts.OutsideJustification.middle,
            titleStyleSpec: charts.TextStyleSpec(
              color: charts.Color.white,
              fontSize: 10,
            )
        ),
      ],
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<OrdinalSales, String>> _createSampleData() {
    final data = [
      new OrdinalSales('2014', 5),
      new OrdinalSales('2015', 25),
      new OrdinalSales('2016', 100),
      new OrdinalSales('2017', 75),
      new OrdinalSales('2018', 5),
      new OrdinalSales('2019', 25),
      new OrdinalSales('2020', 100),
      // new OrdinalSales('2021', 75),
    ];

    return [
      new charts.Series<OrdinalSales, String>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }
}

/// Sample ordinal data type.
class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}
