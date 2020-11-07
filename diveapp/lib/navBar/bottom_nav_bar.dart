import 'package:diveapp/main.dart';
import 'package:flutter/material.dart';

import 'bottom_nav_bar_item.dart';
import 'wave_clipper.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  setPage() {
    setState(() {
      pageController.jumpToPage(currentIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: Material(
        color: Colors.transparent,
        child: Stack(
          children: <Widget>[
            Positioned(
              bottom: 0,
              child: ClipPath(
                  clipper: WaveClipper(),
                  child: Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                            Theme.of(context).primaryColor.withAlpha(150),
                            Theme.of(context).primaryColor
                          ])))),
            ),
            Positioned(
              bottom: 45,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  BottomNavBarItem(setPage: setPage, icon: Icons.home, id: 0),
                  Container(),
                  BottomNavBarItem(setPage: setPage, icon: Icons.list, id: 1),
                  Container(),
                  BottomNavBarItem(
                      setPage: setPage, icon: Icons.settings, id: 2)
                ],
              ),
            ),
            Positioned(
              bottom: 10,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    'Home',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Container(),
                  Text(
                    'Diving log',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Container(),
                  Text(
                    'Settings',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
