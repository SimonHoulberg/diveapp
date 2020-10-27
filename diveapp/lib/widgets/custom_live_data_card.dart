import 'package:diveapp/models/dive_device.dart';
import 'package:flutter/material.dart';

class CustomLiveDataCard extends StatelessWidget {
  final DiveDevice _device;

  List<String> parameters = [
    'Depth',
    'Bottom',
    'Coordinates',
    'Time',
    'Status',
  ];

  CustomLiveDataCard(
    this._device,
  );

  @override
  Widget build(BuildContext context) {
    if (this._device.connectedUser == null) {
      //return card without dive parameters
      return new Container(
          child: Card(
              margin: EdgeInsets.all(4),
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)),
              child: Column(
                children: <Widget>[
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(this._device.name,
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.indigo,
                            )),
                        Text(' : ',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.indigo,
                            )),
                        Text(
                          "No user",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                            fontStyle: FontStyle.italic,
                          ),
                        )
                      ]),
                  _buildDivider(),
                  ElevatedButton(onPressed: null, child: Text('Select User'))
                ],
              )));
    } else {
      // return card with dive parameters
      return new Container(
          child: Card(
              margin: EdgeInsets.all(4),
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)),
              child: Column(
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                          this._device.name +
                              ' : ' +
                              this._device.connectedUser.name,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.indigo,
                          ))),
                  _buildDivider(),
                  Wrap(
                    children: [
                      for (var param in parameters)
                        Card(
                            margin: EdgeInsets.all(2),
                            elevation: 2.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.0)),
                            child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Text(param +
                                    ': ' +
                                    this
                                        ._device
                                        .getParameter(param)
                                        .toString())))
                    ],
                  )
                ],
              )));
    }
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
