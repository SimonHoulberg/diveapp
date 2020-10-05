import 'package:diveapp/pages/dive_Log_Page.dart';
import 'package:diveapp/pages/profile_Page.dart';
import 'package:diveapp/pages/settings_Page.dart';
import 'package:flutter/material.dart';

class Home_Page extends StatelessWidget {
  List<Widget> navBarPages = [
    Profile_Page(),
    Dive_Log_Page(),
    Settings_Page(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: PageView(children: navBarPages),
    );
  }
}
