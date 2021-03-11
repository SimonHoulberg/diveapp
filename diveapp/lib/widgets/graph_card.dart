/// Timeseries chart example
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class GraphCard extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  GraphCard(this.seriesList, {this.animate});

  /// Creates a [TimeSeriesChart] with sample data and no transition.
  factory GraphCard.withSampleData() {
    return new GraphCard(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new charts.LineChart(
      seriesList,
      animate: animate,
      flipVerticalAxis: true,
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<DepthLine, int>> _createSampleData() {
    final data = [
      new DepthLine(0, 0),
      new DepthLine(1, 2),
      new DepthLine(2, 3),
      new DepthLine(3, 3),
      new DepthLine(4, 5),
      new DepthLine(5, 10),
      new DepthLine(6, 12),
      new DepthLine(7, 8),
      new DepthLine(8, 5),
      new DepthLine(9, 3),
      new DepthLine(10, 0),
    ];

    return [
      new charts.Series<DepthLine, int>(
        id: 'Depth',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (DepthLine sample, _) => sample.time,
        measureFn: (DepthLine sample, _) => sample.depth,
        data: data,
      )
    ];
  }
}

/// Sample time series data type.
class DepthLine {
  final int time;
  final int depth;

  DepthLine(this.time, this.depth);
}
