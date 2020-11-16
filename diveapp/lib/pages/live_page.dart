import 'dart:async';
import 'dart:math';

import 'package:diveapp/models/attendee.dart';
import 'package:diveapp/models/dive_device.dart';
import 'package:diveapp/models/dive_entry.dart';
import 'package:diveapp/models/dive_session.dart';
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
//TESTING TIMER
  //Creating a random number generator
  Random _random = new Random();
  //Recursive method to update state every 1 second
  void _timer() {
    Future.delayed(Duration(seconds: 1)).then((_) {
      int index = _random.nextInt(6);
      //initializes depth if null, or reset to 0 if above 15 (also sets max depth before reset)
      if (mockList[index].depth == null || mockList[index].depth > 15) {
        if (mockList[index].depth != null) {
          mockList[index].bottomDive = mockList[index].depth;
          mockList[index].status = "UP";
        }
        mockList[index].depth = 0;
      } else {
        mockList[index].status = "DW";
      }

      mockList[index].depth = // set the depth of the linked device
          mockList[index].depth +
              _random.nextInt(5); // to be increased by a random number (max 5)

      mockList[index].time = timerToString();

      //Coordiante list for test
      List<String> coord = ['N', 'S', 'W', 'E'];
      // set random from list
      mockList[index].coordinates = coord[_random.nextInt(4)];
      setState(() {});

      // save data to session list

      for (var attendingUser in session.attending) {
        DiveDevice attendingUserDevice = mockList.firstWhere(
            (device) => (device.deviceID == attendingUser.deviceID));

        attendingUser.entries.add(new DiveEntry(
            attendingUserDevice.time,
            attendingUserDevice.depth.toString(),
            attendingUserDevice.bottomDive.toString(),
            attendingUserDevice.coordinates,
            attendingUserDevice.time,
            attendingUserDevice.status));
      }

      _timer(); // call itself to make it recursive
    });
  }

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

  //Time of dive
  var swatch = Stopwatch();
  //Turn stopwatch time into String
  String timerToString() {
    return (swatch.elapsed.inHours % 100).toString().padLeft(2, "0") +
        ":" +
        (swatch.elapsed.inMinutes % 60).toString().padLeft(2, "0") +
        ":" +
        (swatch.elapsed.inSeconds % 60).toString().padLeft(2, "0");
  }

  //Initialize structure to save (current date and empty attendee list)
  DiveSession session = new DiveSession(
      "sessionID", "name", "location", DateTime.now().toString(), []);

  //Save dive data every seconds

  saveData() {
    for (var entry in mockList) {
      if (entry.connectedUser != null) {
        session.attending.add(new Attendee(entry.connectedUser.userID,
            entry.deviceID, entry.connectedUser.name));
      }
    }
  }

  @override
  void initState() {
    swatch.start();
    _timer();
    Timer saver = Timer.periodic(Duration(seconds: 5), saveData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
        isMaterialAppTheme: true,
        data: ThemeData(brightness: Brightness.light),
        child: Scaffold(
          backgroundColor: Colors.grey.shade200,
          body: Container(
            padding: const EdgeInsets.all(16.0),
            child: ListView.builder(
                itemCount: mockList.length + 1,
                itemBuilder: (context, index) {
                  if (mockList.length != index) {
                    return CustomLiveDataCard(mockList[index]);
                  } else {
                    return Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Flexible(
                              flex: 3,
                              child: Card(
                                  elevation: 4.0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0)),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(24, 12, 24, 12),
                                    child: ElevatedButton(
                                        style: ButtonStyle(backgroundColor:
                                            MaterialStateProperty.resolveWith(
                                                (Set<MaterialState> states) {
                                          if (states.contains(
                                              MaterialState.pressed)) {
                                            return Theme.of(context)
                                                .primaryColor;
                                          }
                                          return Theme.of(context)
                                              .primaryColorLight;
                                        })),
                                        onPressed: () {
                                          // TODO
                                        },
                                        child: Text("Add Device")),
                                  ))),
                          Flexible(
                              flex: 3,
                              child: Card(
                                  elevation: 4.0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0)),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(24, 12, 24, 12),
                                    child: ElevatedButton(
                                      style: ButtonStyle(backgroundColor:
                                          MaterialStateProperty.resolveWith(
                                              (Set<MaterialState> states) {
                                        if (states
                                            .contains(MaterialState.pressed)) {
                                          return Theme.of(context).primaryColor;
                                        }
                                        return Theme.of(context)
                                            .primaryColorLight;
                                      })),
                                      onPressed: () {
                                        // TODO
                                      },
                                      child: Text("Add User"),
                                    ),
                                  ))),
                        ],
                      ),
                      //TODO add device button (add user button?)
                    );
                  }
                }),
          ),
        ));
  }
}
