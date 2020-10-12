import 'package:flutter/material.dart';
import 'package:mock_data/mock_data.dart';

class DiveLogTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // variables for widget
    var name = "Name";
    var depth = "Depth";
    var bottomDive = "Bottom";
    var coordinates = "Coordinates";
    var time = "Time";
    var status = "Status";

    List<Widget> space(double gap, Iterable<Widget> children) => children
        .expand((item) sync* {
          yield const SizedBox(width: 10);
          yield item;
        })
        .skip(1)
        .toList();

    return Container(
      // red circle
      child: IntrinsicHeight(
        // make it fill parent height
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: space(10.0, <Widget>[
            Expanded(
              child: Center(
                child: Text(
                  name.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  depth.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  bottomDive.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  coordinates.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  time.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  status.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ]),
        ),
      ),

      padding: EdgeInsets.all(16),

      height: 100,
    );
  }
}
