import 'package:diveapp/main.dart';
import 'package:flutter/material.dart';

class BottomNavBarItem extends StatelessWidget {
  final IconData icon;
  final int id;
  final Function setPage;

  const BottomNavBarItem({this.setPage, this.icon, this.id});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        currentIndex = id;
        setPage();
      },
      child: SizedBox(
        height: 64,
        width: MediaQuery.of(context).size.width / 3,
        child: Material(
          color: Colors.transparent,
          child: Stack(
            children: <Widget>[
              Positioned(
                bottom: 0,
                width: MediaQuery.of(context).size.width / 3,
                height: MediaQuery.of(context).size.height,
                child: Material(
                  color: currentIndex == id
                      ? Theme.of(context).primaryColor
                      : Theme.of(context).backgroundColor,
                ),
              ),
              Center(
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 32.0,
                ),
              ),
              Positioned(
                bottom: 59, //5px black bar on selected
                width: MediaQuery.of(context).size.width / 3,
                height: MediaQuery.of(context).size.height,
                child: SizedBox(
                  child: Material(
                    color: currentIndex == id
                        ? Colors.black
                        : Theme.of(context).backgroundColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
