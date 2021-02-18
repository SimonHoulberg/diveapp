import 'package:diveapp/models/dive_device.dart';
import 'package:flutter/material.dart';

class CustomLiveDataCard extends StatefulWidget {
  final DiveDevice _device;

  CustomLiveDataCard(
    this._device,
  );

  @override
  _CustomLiveDataCardState createState() => _CustomLiveDataCardState();
}

class _CustomLiveDataCardState extends State<CustomLiveDataCard> {
  List<String> parameters = [
    'Depth',
    'Bottom',
    'Coordinates',
    'Time',
    'Status',
  ];
  @override
  Widget build(BuildContext context) {
    if (this.widget._device.connectedUser == null) {
      //return card without dive parameters
      return new Container(child: Card());
    } else {
      // return card with dive parameters
      return new SizedBox(
          height: 64,
          child: Card(
              margin: EdgeInsets.all(6),
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)),
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment(-0.9, 0.0),
                    child: Text(this.widget._device.connectedUser.name,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.indigo,
                        )),
                  ),
                  Align(
                    alignment: Alignment(-0.3, 0.0),
                    child: Text(this
                        .widget
                        ._device
                        .getParameter(parameters[0])
                        .toString()),
                  ),
                  Align(
                    alignment: Alignment(0.0, 0.0),
                    child: Text(this
                        .widget
                        ._device
                        .getParameter(parameters[1])
                        .toString()),
                  ),
                  Align(
                    alignment: Alignment(0.3, 0.0),
                    child: Text(this
                        .widget
                        ._device
                        .getParameter(parameters[2])
                        .toString()),
                  ),
                  Align(
                    alignment: Alignment(0.6, 0.0),
                    child: Text(this
                        .widget
                        ._device
                        .getParameter(parameters[3])
                        .toString()),
                  ),
                  Align(
                    alignment: Alignment(0.9, 0.0),
                    child: Text(this
                        .widget
                        ._device
                        .getParameter(parameters[4])
                        .toString()),
                  ),
                ],
              )));
    }
  }
}
