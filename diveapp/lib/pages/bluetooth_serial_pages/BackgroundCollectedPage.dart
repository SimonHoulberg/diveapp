import 'package:flutter/material.dart';

import './BackgroundCollectingTask.dart';

class BackgroundCollectedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final BackgroundCollectingTask task =
        BackgroundCollectingTask.of(context, rebuildOnChange: true);

    return Scaffold(
        appBar: AppBar(
          title: Text('Collected data'),
          actions: <Widget>[
            // Progress circle
            (task.inProgress
                ? FittedBox(
                    child: Container(
                        margin: new EdgeInsets.all(16.0),
                        child: CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white))))
                : Container(/* Dummy */)),
            // Start/stop buttons
            (task.inProgress
                ? IconButton(icon: Icon(Icons.pause), onPressed: task.pause)
                : IconButton(
                    icon: Icon(Icons.play_arrow), onPressed: task.reasume)),
          ],
        ),
        body: ListView(
          children: <Widget>[
            Divider(),
            ListTile(
              title: const Text('Depth'),
            ),
            Container(
              child: Text(task.getNewestSampleString()),
            )
          ],
        ));
  }
}
