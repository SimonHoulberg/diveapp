import 'package:diveapp/main.dart';
import 'package:flutter/material.dart';
import 'bottom_nav_bar_item.dart';

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
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).secondaryHeaderColor,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  BottomNavBarItem(setPage: setPage, icon: Icons.home, id: 0),
                  BottomNavBarItem(setPage: setPage, icon: Icons.list, id: 1),
                  BottomNavBarItem(
                      setPage: setPage, icon: Icons.settings, id: 2)
                ],
              ),
            ),
            // Positioned(
            //   bottom: 10,
            //   width: MediaQuery.of(context).size.width,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     children: <Widget>[
            //       Text(
            //         'Home',
            //         style: TextStyle(fontWeight: FontWeight.bold),
            //       ),
            //       Container(),
            //       Text(
            //         'Diving log',
            //         style: TextStyle(fontWeight: FontWeight.bold),
            //       ),
            //       Container(),
            //       Text(
            //         'Settings',
            //         style: TextStyle(fontWeight: FontWeight.bold),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
