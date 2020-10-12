import 'package:diveapp/bottom_Nav_Bar.dart';
import 'package:diveapp/main.dart';
import 'package:diveapp/pages/DiveLogPage.dart';
import 'package:diveapp/pages/profile_Page.dart';
import 'package:diveapp/pages/settings_Page.dart';
import 'package:flutter/material.dart';

class Home_Page extends StatelessWidget {
  List<Widget> navBarPages = [
    Profile_Page(),
    DiveLogPage(),
    Settings_Page(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: PageView(
          controller: pageController,
          physics: NeverScrollableScrollPhysics(),
          children: navBarPages),
      bottomNavigationBar: Bottom_Nav_Bar(),
    );
  }
}
