import 'package:diveapp/screen_size_reducers.dart';
import 'package:flutter/material.dart';

final int logSize = 100;

class Dive_Log_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = screenHeightExcludingToolbar(context);
    print("HEIGHT: " + screenHeight.toString());
    return Scaffold(
      // appBar: AppBar(title: const Text('Empty List Test')),
      body: logSize > 0
          ? Center(
              child: Scrollbar(
                thickness: 8,
                radius: Radius.circular(5),
                child: ListView.separated(
                  padding: const EdgeInsets.all(8),
                  itemCount: logSize,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 50,
                      color: Theme.of(context).primaryColor.withOpacity(1),
                      child: Center(child: Text(index.toString())),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                ),
              ),
            )
          : Center(child: const Text('No divers found')),
    );
  }
}

class ScrollBar {}
