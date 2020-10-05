import 'package:diveapp/pages/dive_Log_Page.dart';
import 'package:diveapp/pages/home_Page.dart';
import 'package:diveapp/pages/profile_Page.dart';
import 'package:diveapp/pages/settings_Page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(diveApp());
}

class diveApp extends StatelessWidget {
  List<Widget> navBarScreens = [
    Profile_Page(),
    Dive_Log_Page(),
    Settings_Page(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dive App',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // extendBody: true,
      home: Home_Page(),
    );
  }
}
