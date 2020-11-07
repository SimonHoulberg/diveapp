import 'package:diveapp/main.dart';
import 'package:diveapp/navBar/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

import 'live_page.dart';
import 'dive_log_page.dart';
import 'settings_page.dart';

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
