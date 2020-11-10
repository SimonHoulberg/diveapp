import 'dart:math';

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

//TESTING TIMER
  //Creating a random number generator
  Random _random = new Random();
  //Recursive method to update state every 1 second
  void _timer() {
    Future.delayed(Duration(seconds: 1)).then((_) {
      this.setState(() {
        if (this.widget._device.depth == null) {
          this.widget._device.depth = 0;
        }
        this.widget._device.depth = // set the depth of the linked device
            this.widget._device.depth +
                _random
                    .nextInt(2); // to be increased by a random number (max 2)

        print("Updating depth for device:" + this.widget._device.name);
        print("New depth:" + this.widget._device.depth.toString());
      });
      _timer(); // call itself to make it recursive
    });
  }

  @override
  Widget build(BuildContext context) {
    if (this.widget._device.connectedUser == null) {
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
                        Text(this.widget._device.name,
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
                  ElevatedButton(
                      onPressed: null,
                      style: ButtonStyle(backgroundColor:
                          MaterialStateProperty.resolveWith(
                              (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Theme.of(context).accentColor;
                        }
                        return Theme.of(context).primaryColorLight;
                      })),
                      child: Text(
                        'Select User',
                      ))
                ],
              )));
    } else {
      // return card with dive parameters
      _timer();
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
                          this.widget._device.name +
                              ' : ' +
                              this.widget._device.connectedUser.name,
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
                                        .widget
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
