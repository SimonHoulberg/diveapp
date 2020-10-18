import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      isMaterialAppTheme: true,
      data: ThemeData(
        brightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: null,
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            SingleChildScrollView(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Card(
                    elevation: 8.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    color: Theme.of(context).primaryColor,
                    child: ListTile(
                      title: Text(
                        "General settings",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SwitchListTile(
                    activeColor: Theme.of(context).primaryColor,
                    contentPadding: const EdgeInsets.all(16),
                    value: true,
                    title: Text("setting1"),
                    onChanged: (bool value) {
                      value = !value;
                    },
                  ),
                  SwitchListTile(
                    activeColor: Theme.of(context).primaryColor,
                    contentPadding: const EdgeInsets.all(16),
                    value: false,
                    title: Text("setting2"),
                    onChanged: null,
                  ),
                  SwitchListTile(
                    activeColor: Theme.of(context).primaryColor,
                    contentPadding: const EdgeInsets.all(16),
                    value: true,
                    title: Text("setting3"),
                    onChanged: (val) {},
                  ),
                  SwitchListTile(
                    activeColor: Theme.of(context).primaryColor,
                    contentPadding: const EdgeInsets.all(16),
                    value: true,
                    title: Text("setting4"),
                    onChanged: null,
                  ),
                  Card(
                    elevation: 8.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    color: Theme.of(context).primaryColor,
                    child: ListTile(
                      title: Text(
                        "Other settings",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: Icon(
                        Icons.settings_applications_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SwitchListTile(
                    activeColor: Theme.of(context).primaryColor,
                    contentPadding: const EdgeInsets.all(16),
                    value: true,
                    title: Text("setting5"),
                    onChanged: (val) {},
                  ),
                  SwitchListTile(
                    activeColor: Theme.of(context).primaryColor,
                    contentPadding: const EdgeInsets.all(16),
                    value: true,
                    title: Text("setting6"),
                    onChanged: (val) {},
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
