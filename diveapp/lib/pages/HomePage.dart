import 'package:diveapp/main.dart';
import 'package:diveapp/navBar/BottomNavBar.dart';
import 'package:flutter/material.dart';

import 'LivePage.dart';
import 'DiveLogPage.dart';
import 'WelcomePage.dart';
import 'SettingsPage.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> navBarPages = [
      LivePage(), //WelcomePage(),
      DiveLogPage(),
      SettingsPage(),
    ];

    return Scaffold(
      extendBody: true,
      body: PageView(
          controller: pageController,
          physics: NeverScrollableScrollPhysics(),
          children: navBarPages),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
