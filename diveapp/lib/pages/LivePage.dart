import 'package:diveapp/models/dive_device.dart';
import 'package:diveapp/models/user.dart';
import 'package:diveapp/widgets/custom_live_data_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LivePage extends StatefulWidget {
  LivePage({Key key}) : super(key: key);

  @override
  _LivePageState createState() => _LivePageState();
}

class _LivePageState extends State<LivePage> {
  //Mock data list
  List<DiveDevice> mockList = [
    new DiveDevice(
        '1', 'device1', new User(name: 'Anders', email: 'a', password: 'a')),
    new DiveDevice(
        '2', 'device2', new User(name: 'Paulius', email: 'a', password: 'a')),
    new DiveDevice(
        '3', 'device3', new User(name: 'Simon', email: 'a', password: 'a')),
    new DiveDevice(
        '4', 'device4', new User(name: 'Putin', email: 'a', password: 'a')),
    new DiveDevice(
        '4', 'device4', new User(name: 'Putin', email: 'a', password: 'a')),
    new DiveDevice(
        '4', 'device4', new User(name: 'Putin', email: 'a', password: 'a')),
    new DiveDevice('5', 'unfds', null),
    new DiveDevice('5', 'unlinkedDevice', null),
    new DiveDevice('5', 'unlinkedDevice', null),
  ];

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData(brightness: Brightness.light),
        child: Scaffold(
          body: Container(
            padding: const EdgeInsets.all(16.0),
            child: ListView.builder(
                itemCount: mockList.length + 1,
                itemBuilder: (context, index) {
                  if (mockList.length != index) {
                    return CustomLiveDataCard(mockList[index]);
                  } else {
                    return Container(
                        //TODO add device button (add user button?)
                        );
                  }
                }),
          ),
        ));
  }
}
