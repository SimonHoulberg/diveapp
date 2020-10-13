import 'package:flutter/material.dart';
import 'package:mock_data/mock_data.dart';

class DiveLogColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // variables for widget
    var name = mockName();
    var depth = mockInteger(50, 100);
    var bottomDive = mockInteger(1, 40);
    var coordinates = mockInteger(0, 3) == 0
        ? "NW"
        : mockInteger(0, 3) == 1
            ? "NE"
            : mockInteger(0, 3) == 2
                ? "SE"
                : mockInteger(0, 3) == 3
                    ? "SW"
                    : "NW";
    var time = mockInteger(1, 60);
    var status = mockInteger(0, 1) == 1 ? "UP" : "DOWN";

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
              child: Container(
                //color: Theme.of(context).primaryColorDark,
                child: Center(
                  child: Text(
                    name.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColorDark.withOpacity(0.1),
                  borderRadius: BorderRadius.all(
                    const Radius.circular(8),
                  ),
                ),
                padding: EdgeInsets.all(16),
              ),
            ),
            Expanded(
              child: Container(
                //color: Theme.of(context).primaryColorDark,
                child: Center(
                  child: Text(
                    depth.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColorDark.withOpacity(0.1),
                  borderRadius: BorderRadius.all(
                    const Radius.circular(8),
                  ),
                ),
                padding: EdgeInsets.all(16),
              ),
            ),
            Expanded(
              child: Container(
                //color: Theme.of(context).primaryColorDark,
                child: Center(
                  child: Text(
                    bottomDive.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColorDark.withOpacity(0.1),
                  borderRadius: BorderRadius.all(
                    const Radius.circular(8),
                  ),
                ),
                padding: EdgeInsets.all(16),
              ),
            ),
            Expanded(
              child: Container(
                //color: Theme.of(context).primaryColorDark,
                child: Center(
                  child: Text(
                    coordinates.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColorDark.withOpacity(0.1),
                  borderRadius: BorderRadius.all(
                    const Radius.circular(8),
                  ),
                ),
                padding: EdgeInsets.all(16),
              ),
            ),
            Expanded(
              child: Container(
                //color: Theme.of(context).primaryColorDark,
                child: Center(
                  child: Text(
                    time.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColorDark.withOpacity(0.1),
                  borderRadius: BorderRadius.all(
                    const Radius.circular(8),
                  ),
                ),
                padding: EdgeInsets.all(16),
              ),
            ),
            Expanded(
              child: Container(
                //color: Theme.of(context).primaryColorDark,
                child: Center(
                  child: Text(
                    status.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColorDark.withOpacity(0.1),
                  borderRadius: BorderRadius.all(
                    const Radius.circular(8),
                  ),
                ),
                padding: EdgeInsets.all(16),
              ),
            ),
          ]),
        ),
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorLight,
        borderRadius: BorderRadius.all(
          const Radius.circular(8),
        ),
      ),
      padding: EdgeInsets.all(16),

      height: 100,
    );
  }
}
