import 'package:diveapp/pages/HomePage.dart';
import 'package:flutter/material.dart';

PageController pageController = PageController(initialPage: 0);
int currentIndex = 0;

void main() {
  runApp(DiveApp());
}

class DiveApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dive App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // extendBody: true,
      home: HomePage(),
    );
  }
}
