import 'package:diveapp/bottom_Nav_Bar_Item.dart';
import 'package:diveapp/main.dart';
import 'package:diveapp/wave_Clipper.dart';
import 'package:flutter/material.dart';

class Bottom_Nav_Bar extends StatefulWidget {
  @override
  _Bottom_Nav_BarState createState() => _Bottom_Nav_BarState();
}

class _Bottom_Nav_BarState extends State<Bottom_Nav_Bar> {
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
                  clipper: Wave_Clipper(),
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
                  Bottom_Nav_Bar_Item(
                      setPage: setPage, icon: Icons.face, id: 0),
                  Container(),
                  Bottom_Nav_Bar_Item(
                      setPage: setPage, icon: Icons.list, id: 1),
                  Container(),
                  Bottom_Nav_Bar_Item(
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
                    'Profile',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Container(),
                  Text(
                    'Dive Log',
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
