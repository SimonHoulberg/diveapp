import 'package:diveapp/pages/DiveLogColumn.dart';
import 'package:diveapp/pages/DiveLogTitle.dart';
import 'package:flutter/material.dart';

final int logSize = 100;

class DiveLogPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text('Empty List Test')),
      body: logSize > 0
          ? Column(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(8),
                  height: 75,
                  color: Theme.of(context).primaryColor,
                  child: DiveLogTitle(),
                ),
                Expanded(
                  child: Scrollbar(
                    thickness: 8,
                    radius: Radius.circular(5),
                    child: ListView.separated(
                      padding: const EdgeInsets.all(8),
                      itemCount: logSize,
                      itemBuilder: (BuildContext context, int index) {
                        return DiveLogColumn();
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          const Divider(height: 10),
                    ),
                  ),
                ),
              ],
            )
          : Center(child: const Text('No divers found')),
    );
  }
}

class ScrollBar {}
