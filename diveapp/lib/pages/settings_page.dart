import 'dart:convert';

import 'package:diveapp/pages/auth_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:audioplayers/audio_cache.dart';
import 'package:vibration/vibration.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  Future<String> getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token");
    var response = await http.get(
      Uri.parse("http://localhost:5000/user"),
      headers: {'Authorization': 'Bearer $token'},
    );

    return response.body;
  }

  @override
  Widget build(BuildContext context) {
    var userName = "empty";

    return FutureBuilder(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          // if loading return indicator
          if (snapshot.connectionState == ConnectionState.waiting) {
            print("waiting");
            return CircularProgressIndicator();
          }
          // if loaded return view
          if (true) {
            var receivedData = jsonDecode(snapshot.data);
            var decoded = receivedData["decoded"];
            userName = decoded["name"];

            return Theme(
              // isMaterialAppTheme: true,
              data: ThemeData(
                brightness: Brightness.light,
              ),
              child: Scaffold(
                backgroundColor: Colors.grey.shade200,
                body: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    SingleChildScrollView(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Card(
                            elevation: 4.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0)),
                            color: Theme.of(context).primaryColor,
                            child: ListTile(
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image(
                                  image: AssetImage('avatar_mock.jpg'),
                                ),
                              ),
                              title: Text(
                                userName,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              subtitle: Text(
                                "\nPresident of Russia", //TODO
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              isThreeLine: true,
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          Container(
                            margin: EdgeInsets.all(8.0),
                            child: Text(
                              "Account",
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.indigo,
                              ),
                            ),
                          ),
                          Card(
                            elevation: 4.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0)),
                            child: Column(
                              children: <Widget>[
                                ListTile(
                                  leading: Icon(
                                    Icons.lock_outline,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  title: Text("Change Password"),
                                  trailing: Icon(Icons.keyboard_arrow_right),
                                  onTap: () {
                                    //TODO
                                  },
                                ),
                                _buildDivider(),
                                ListTile(
                                  leading: Icon(
                                    Icons.logout,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  title: Text("Log out"),
                                  trailing: Icon(Icons.keyboard_arrow_right),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => AuthPage()),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          Container(
                            margin: EdgeInsets.all(8.0),
                            child: Text(
                              "General", //TODO
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.indigo,
                              ),
                            ),
                          ),
                          Card(
                            elevation: 4.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0)),
                            child: Column(
                              children: <Widget>[
                                ListTile(
                                  leading: Icon(
                                    Icons.textsms,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  title: Text("Notification test"),
                                  trailing: Icon(Icons.keyboard_arrow_right),
                                  onTap: () {
                                    _playSound("alert.mp3");
                                    _vibrate();
                                    _flashScreen(
                                        context, "Error message example");
                                  },
                                ),
                                _buildDivider(),
                                ListTile(
                                  leading: Icon(
                                    Icons.access_alarm,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  title: Text("Setting example"), //TODO
                                  trailing: Icon(Icons.keyboard_arrow_right),
                                  onTap: () {
                                    //TODO
                                  },
                                ),
                                _buildDivider(),
                                ListTile(
                                  leading: Icon(
                                    Icons.youtube_searched_for_outlined,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  title: Text("Setting example"), //TODO
                                  trailing: Icon(Icons.keyboard_arrow_right),
                                  onTap: () {
                                    //TODO
                                  },
                                ),
                                _buildDivider(),
                                ListTile(
                                  leading: Icon(
                                    Icons.laptop_chromebook,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  title: Text("Setting example"), //TODO
                                  trailing: Icon(Icons.keyboard_arrow_right),
                                  onTap: () {
                                    //TODO
                                  },
                                ),
                                _buildDivider(),
                                SwitchListTile(
                                  secondary: Icon(
                                    Icons.person_add,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  activeColor: Theme.of(context).primaryColor,
                                  value: true, //TODO
                                  title: Text("Setting example"), //TODO
                                  onChanged: (bool value) {
                                    //TODO
                                  },
                                ),
                                _buildDivider(),
                                CheckboxListTile(
                                  secondary: Icon(
                                    Icons.logout,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  value: false, //TODO
                                  title: Text("Setting example"), //TODO
                                  onChanged: (bool value) {
                                    //TODO
                                  },
                                ),
                                _buildDivider(),
                                ListTile(
                                  leading: Icon(
                                    Icons.logout,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  title: Text("Setting example"), //TODO
                                  trailing: Icon(Icons.keyboard_arrow_right),
                                  onTap: () {
                                    //TODO
                                  },
                                ),
                                _buildDivider(),
                                ListTile(
                                  leading: Icon(
                                    Icons.logout,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  title: Text("Setting example"), //TODO
                                  trailing: Icon(Icons.keyboard_arrow_right),
                                  onTap: () {
                                    //TODO
                                  },
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 110,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }

          // if both falase then return container
          return Container();
        });
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

  void _playSound(var sound) async {
    AudioCache player = AudioCache();
    await player.play(sound);
  }

  void _vibrate() async {
    if (await Vibration.hasVibrator()) {
      Vibration.vibrate();
    }
  }

  void _flashScreen(BuildContext context, var errorMsg) {
    var blink = true;
    var flashingCount = 0;
    var maxFlashingCount = 3;
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
}
