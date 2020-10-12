import 'package:diveapp/pages/DiveLogPage.dart';
import 'package:diveapp/pages/home_Page.dart';
import 'package:diveapp/pages/profile_Page.dart';
import 'package:diveapp/pages/settings_Page.dart';
import 'package:flutter/material.dart';

PageController pageController = PageController(initialPage: 0);
int currentIndex = 0;

void main() {
  runApp(diveApp());
}

class diveApp extends StatelessWidget {
  List<Widget> navBarScreens = [
    Profile_Page(),
    DiveLogPage(),
    Settings_Page(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dive App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // extendBody: true,
      home: Home_Page(),
    );
  }
}
