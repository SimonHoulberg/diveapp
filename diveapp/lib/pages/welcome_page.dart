import 'dart:convert';

import 'package:bezier_chart/bezier_chart.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List<DataPoint> _items;
  List<double> _xAxis;

  void _loadData() async {
    await Future.delayed(Duration(seconds: 3));
    final String data =
        '[{"Day":"0","Value":"2"},{"Day":1,"Value":"5"},{"Day":2,"Value":"2"},{"Day":3,"Value":"6"},{"Day":4,"Value":"8"}]';
    final List list = json.decode(data);
    setState(() {
      _items = list
          .map((item) => DataPoint(
              value: double.parse(item["Value"].toString()),
              xAxis: double.parse(item["Day"].toString())))
          .toList();
      _xAxis =
          list.map((item) => double.parse(item["Day"].toString())).toList();
    });
  }

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _items != null
          ? SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Card(
                    elevation: 4.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                    color: Theme.of(context).primaryColor,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.05,
                      child: Center(
                        child: Text(
                          "Your last trip", //TODO
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Card(
                    elevation: 4.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                    child: Container(
                      height: MediaQuery.of(context).size.height / 2,
                      width: MediaQuery.of(context).size.width,
                      child: BezierChart(
                        bezierChartScale: BezierChartScale.CUSTOM,
                        xAxisCustomValues: _xAxis,
                        footerValueBuilder: (double value) {
                          return "${formatAsIntOrDouble(value)}\nminutes";
                        },
                        series: [
                          BezierLine(
                            label: "m",
                            data: _items,
                            lineColor: Colors.black,
                          ),
                        ],
                        config: BezierChartConfig(
                            startYAxisFromNonZeroValue: false,
                            bubbleIndicatorColor: Colors.white.withOpacity(0.9),
                            footerHeight: 40,
                            verticalIndicatorStrokeWidth: 3.0,
                            verticalIndicatorColor: Colors.black26,
                            showVerticalIndicator: true,
                            verticalIndicatorFixedPosition: false,
                            displayYAxis: true,
                            stepsYAxis: 1,
                            snap: false,
                            yAxisTextStyle:
                                TextStyle(fontSize: 12, color: Colors.black),
                            xAxisTextStyle:
                                TextStyle(fontSize: 12, color: Colors.black),
                            backgroundColor: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            )
          : CircularProgressIndicator(),
    );
  }

  Container _buildDivider() {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      width: double.infinity,
      height: 1.0,
      color: Colors.grey.shade400,
    );
  }
}
