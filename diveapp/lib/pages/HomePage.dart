import 'package:diveapp/main.dart';
import 'package:diveapp/navBar/BottomNavBar.dart';
import 'package:flutter/material.dart';

import 'DiveLogPage.dart';
import 'ProfilePage.dart';
import 'SettingsPage.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> navBarPages = [
      ProfilePage(),
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
