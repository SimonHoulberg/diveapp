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
      child: CircleAvatar(
        radius: 30,
        backgroundColor: Theme.of(context).primaryColor,
        child: CircleAvatar(
          radius: 25,
          backgroundColor: currentIndex == id
              ? Colors.white.withOpacity(0.9)
              : Colors.transparent,
          child: Icon(
            icon,
            color: currentIndex == id
                ? Colors.black
                : Colors.white.withOpacity(0.9),
          ),
        ),
      ),
    );
  }
}
