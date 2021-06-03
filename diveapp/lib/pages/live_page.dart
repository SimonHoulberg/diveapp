import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:audioplayers/audio_cache.dart';
import 'package:diveapp/models/attendee.dart';
import 'package:diveapp/models/dive_device.dart';
import 'package:diveapp/models/dive_entry.dart';
import 'package:diveapp/models/dive_session.dart';
import 'package:diveapp/models/user.dart';
import 'package:diveapp/pages/add_dive_device_page.dart';
import 'package:diveapp/widgets/custom_live_data_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:mock_data/mock_data.dart';
import 'package:vibration/vibration.dart';

class LivePage extends StatefulWidget {
  LivePage({Key key}) : super(key: key);

  @override
  _LivePageState createState() => _LivePageState();
}

class _LivePageState extends State<LivePage> {
//TESTING TIMER
  //Creating a random number generator
  Random _random = new Random();

  bool runBuild = false;
  Icon _fabIcon = Icon(Icons.play_arrow);
  int counterForTrigger = 0;

  //Notification sound for simulation
  void _playSound(var sound) async {
    AudioCache player = AudioCache();
    await player.play(sound);
  }

//Notification vibration for simulation
  void _vibrate() async {
    if (await Vibration.hasVibrator()) {
      Vibration.vibrate();
    }
  }

//Notification UI for simulation
  void _flashScreen(BuildContext context, var errorMsg) {
    var blink = true;
    var flashingCount = 0;
    var maxFlashingCount = 5;
    OverlayEntry overlay;
    overlay = OverlayEntry(builder: (context) {
      return Positioned(
        left: 0,
        right: 0,
        child: Container(
          color: Colors.black,
          child: GestureDetector(
            onTap: () {
              blink = null;
              overlay.remove();
            },
            child: StatefulBuilder(
              builder: (context, setState) {
                Future.delayed(Duration(milliseconds: 700)).then((_) {
                  if (blink != null) setState(() => blink = !blink);
                  flashingCount++;
                  if (flashingCount > maxFlashingCount) {
                    blink = null;
                    flashingCount = 0;
                    overlay.remove();
                  }
                });
                return AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(
                        color: blink ? Colors.red : Colors.black, width: 8),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 16,
                  ),
                  child: Text(
                    errorMsg,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 16,
                      inherit: false,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      );
    });
    Overlay.of(context).insert(overlay);
  }

  //Recursive method to update state every 1 second
  void _timer() {
    Future.delayed(Duration(seconds: 1)).then((_) {
      int index = _random.nextInt(6);
      counterForTrigger += 1;
      // if the counter is 10 trigger notification
      if (counterForTrigger > 9) {
        mockList[index].depth += 35;
        _playSound("alert.mp3");
        _vibrate();
        _flashScreen(
            context,
            mockList[index].connectedUser.name +
                " diving too deep! Current depth: " +
                mockList[index].depth.toString());
        counterForTrigger = 0;
      } else {
        //initializes depth if null, or reset to 0 if above 25 (also sets max depth before reset)
        if (mockList[index].depth == null || mockList[index].depth > 25) {
          if (mockList[index].depth != null) {
            mockList[index].bottomDive = mockList[index].depth;
            mockList[index].status = "UP";
          }
          mockList[index].depth = 0;
        } else {
          mockList[index].status = "DW";
        }
      }

      mockList[index].depth = // set the depth of the linked device
          mockList[index].depth +
              _random.nextInt(5); // to be increased by a random number (max 5)

      mockList[index].time = timerToString();

      //Coordiante list for test
      List<String> coord = ['N', 'S', 'W', 'E'];
      // set random from list
      mockList[index].coordinates = coord[_random.nextInt(4)];

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
      // if the runBuild bool is true, continue running and update state
      if (runBuild) {
        setState(() {});
        _timer(); // call itself to make it recursive
      }
    });
  }

  //Mock data list
  List<DiveDevice> mockList = [
    new DiveDevice(
        '1', 'device1', new User(name: mockName(), email: 'a', password: 'a')),
    new DiveDevice(
        '2', 'device2', new User(name: mockName(), email: 'a', password: 'a')),
    new DiveDevice(
        '3', 'device3', new User(name: mockName(), email: 'a', password: 'a')),
    new DiveDevice(
        '4', 'device4', new User(name: mockName(), email: 'a', password: 'a')),
    new DiveDevice(
        '4', 'device4', new User(name: mockName(), email: 'a', password: 'a')),
    new DiveDevice(
        '4', 'device4', new User(name: mockName(), email: 'a', password: 'a')),
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
  DiveSession session = new DiveSession("sessionID " + mockInteger().toString(),
      "name", mockString(16), DateTime.now().toString(), []);

  //funtion to initialize the devices with connected user to the attendees list for the session, should be run in initState()
  initializeSessionAttendees() {
    for (var entry in mockList) {
      if (entry.connectedUser != null) {
        session.attending.add(new Attendee(entry.connectedUser.userID,
            entry.deviceID, entry.connectedUser.name));
      }
    }
  }

  @override
  void initState() {
    swatch.start(); // start stopwatch to get time
    initializeSessionAttendees(); // initialize devices with connected users to the attendee list
    super.initState();
  }

  @override
  void dispose() {
    //_sendDiveToDatabase(jsonEncode(session));
    runBuild = false; // to stop setState from running after closing page
    super.dispose();
  }

  // Sends the given json string to the database via backend running on localhost.
  _sendDiveToDatabase(json) async {
    // Setting up the url for the http package
    var url = "http://localhost:5000/add-dive"; // iOS

    // Post the json to the above url
    final http.Response response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json,
    );

    // Show toast to inform user of success
    _showToast(response.body);
  }

  _showToast(response) {
    Map<String, dynamic> json = jsonDecode(response) as Map<String, dynamic>;
    String msg = json['msg'];

    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0,
        webPosition: "center");
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
        //isMaterialAppTheme: true,
        data: ThemeData(brightness: Brightness.light),
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.all(4),
                child: Stack(
                  children: [
                    Align(
                        alignment: Alignment(-0.95, 0.0),
                        child: Card(
                            child: Container(
                          height: 24,
                          width: 160,
                          child: Center(
                              child: Text("Dive ID number",
                                  style: TextStyle(
                                      fontStyle: FontStyle.italic,
                                      fontSize: 16))),
                        ))),
                    Align(
                      alignment: Alignment(-0.5, 0.0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (runBuild) {
                            runBuild = false;
                            _fabIcon = Icon(Icons.play_arrow);

                            var diveLog = jsonEncode(
                                <String, DiveSession>{"dive": session});
                            _sendDiveToDatabase(diveLog);

                            setState(() {});
                          } else {
                            runBuild = true;
                            _timer(); // run the recusive function once to start it
                            _fabIcon = Icon(Icons.pause);
                            setState(() {});
                          }
                        },
                        child: _fabIcon,
                      ),
                    ),

                    // issues tracker
                    Align(
                        alignment: Alignment(0.35, 0.0),
                        child: Card(
                            color: Colors.orange,
                            child: Container(
                              height: 24,
                              width: 72,
                              child: Center(
                                  child: Text("Issues: " + "X", // TODO add var
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ))),
                            ))),
                    // diver count
                    Align(
                        alignment: Alignment(0.95, 0.0),
                        child: Card(
                            color: Colors.cyan,
                            child: Container(
                              height: 24,
                              width: 240,
                              child: Center(
                                  child: Text(
                                      "Number of divers in the water: " + "X",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ))),
                            ))),
                  ],
                )),
            Column(
              children: [
                SizedBox(
                    //Title bar for divers and parameters
                    height: 48,
                    child: Card(
                        margin: EdgeInsets.all(6),
                        elevation: 4.0,
                        color: Colors.indigo,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Stack(
                          children: <Widget>[
                            Align(
                              alignment: Alignment(-0.9, 0.0),
                              child: Text("Name",
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  )),
                            ),
                            Align(
                              alignment: Alignment(-0.3, 0.0),
                              child: Text("Depth",
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  )),
                            ),
                            Align(
                              alignment: Alignment(0.0, 0.0),
                              child: Text("NDL-time",
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  )),
                            ),
                            Align(
                              alignment: Alignment(0.3, 0.0),
                              child: Text("Directions",
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  )),
                            ),
                            Align(
                              alignment: Alignment(0.6, 0.0),
                              child: Text("Dive time",
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  )),
                            ),
                            Align(
                              alignment: Alignment(0.9, 0.0),
                              child: Text("Status",
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  )),
                            ),
                          ],
                        ))),
                // List of divers and parameters
                SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          // Builds the list of devices with users assigned. Uses the custom_live_data_card widget to bu
                          itemCount: mockList.length + 1,
                          itemBuilder: (context, index) {
                            if (mockList.length != index) {
                              return CustomLiveDataCard(mockList[index]);
                            } else {
                              return Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Flexible(
                                        flex: 3,
                                        child: Card(
                                            elevation: 4.0,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8.0)),
                                            child: Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  24, 12, 24, 12),
                                              child: ElevatedButton(
                                                  style: ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStateProperty
                                                              .resolveWith((Set<
                                                                      MaterialState>
                                                                  states) {
                                                    if (states.contains(
                                                        MaterialState
                                                            .pressed)) {
                                                      return Theme.of(context)
                                                          .primaryColor;
                                                    }
                                                    return Theme.of(context)
                                                        .primaryColorLight;
                                                  })),
                                                  onPressed: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                Add_Dive_Device_Page()));
                                                  },
                                                  child: Text("Add Device")),
                                            ))),
                                    Flexible(
                                        flex: 3,
                                        child: Card(
                                            elevation: 4.0,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8.0)),
                                            child: Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  24, 12, 24, 12),
                                              child: ElevatedButton(
                                                style: ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .resolveWith((Set<
                                                                    MaterialState>
                                                                states) {
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
                                                child: Text("Add User"),
                                              ),
                                            ))),
                                  ],
                                ),
                                //TODO add device button (add user button?)
                              );
                            }
                          })
                    ],
                  ),
                )
              ],
            )
          ],
        ));
  }
}
