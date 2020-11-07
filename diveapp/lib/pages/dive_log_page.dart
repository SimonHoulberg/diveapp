import 'package:diveapp/pages/dive_log_column.dart';
import 'package:flutter/material.dart';

final int logSize = 24;

class DiveLogPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      // appBar: AppBar(title: const Text('Empty List Test')),
      body: logSize > 0
          ? Column(
              children: <Widget>[
                Expanded(
                  child: Scrollbar(
                    thickness: 8,
                    radius: Radius.circular(5),
                    child: ListView.separated(
                      padding: const EdgeInsets.all(16),
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
          : Center(child: const Text('No dive log found')),
    );
  }
}
