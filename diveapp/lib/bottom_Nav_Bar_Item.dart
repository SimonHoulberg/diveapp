import 'package:diveapp/main.dart';
import 'package:flutter/material.dart';

class Bottom_Nav_Bar_Item extends StatelessWidget {
  final IconData icon;
  final int id;
  final Function setPage;

  const Bottom_Nav_Bar_Item(this.setPage, this.icon, this.id);

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
          backgroundColor: Colors.white.withOpacity(0.9),
          child: Icon(
            icon,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
