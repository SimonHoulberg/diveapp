import 'package:diveapp/composition_root.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      isMaterialAppTheme: true,
      data: ThemeData(
        brightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Card(
                    elevation: 4.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                    color: Theme.of(context).primaryColor,
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image(
                          image: AssetImage('avatar_mock.jpg'),
                        ),
                      ),
                      title: Text(
                        "Vladimir Putin",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      subtitle: Text(
                        "\nPresident of Russia", //TODO
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      isThreeLine: true,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Container(
                    margin: EdgeInsets.all(8.0),
                    child: Text(
                      "Account",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo,
                      ),
                    ),
                  ),
                  Card(
                    elevation: 4.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          leading: Icon(
                            Icons.lock_outline,
                            color: Theme.of(context).primaryColor,
                          ),
                          title: Text("Change Password"),
                          trailing: Icon(Icons.keyboard_arrow_right),
                          onTap: () {
                            //TODO
                          },
                        ),
                        _buildDivider(),
                        ListTile(
                          leading: Icon(
                            Icons.logout,
                            color: Theme.of(context).primaryColor,
                          ),
                          title: Text("Log out"),
                          trailing: Icon(Icons.keyboard_arrow_right),
                          onTap: () {
                            Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CompositionRoot.composeAuthUi()),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Container(
                    margin: EdgeInsets.all(8.0),
                    child: Text(
                      "General", //TODO
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo,
                      ),
                    ),
                  ),
                  Card(
                    elevation: 4.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          leading: Icon(
                            Icons.textsms,
                            color: Theme.of(context).primaryColor,
                          ),
                          title: Text("Setting example"), //TODO
                          trailing: Icon(Icons.keyboard_arrow_right),
                          onTap: () {
                            //TODO
                          },
                        ),
                        _buildDivider(),
                        ListTile(
                          leading: Icon(
                            Icons.access_alarm,
                            color: Theme.of(context).primaryColor,
                          ),
                          title: Text("Setting example"), //TODO
                          trailing: Icon(Icons.keyboard_arrow_right),
                          onTap: () {
                            //TODO
                          },
                        ),
                        _buildDivider(),
                        ListTile(
                          leading: Icon(
                            Icons.youtube_searched_for_outlined,
                            color: Theme.of(context).primaryColor,
                          ),
                          title: Text("Setting example"), //TODO
                          trailing: Icon(Icons.keyboard_arrow_right),
                          onTap: () {
                            //TODO
                          },
                        ),
                        _buildDivider(),
                        ListTile(
                          leading: Icon(
                            Icons.laptop_chromebook,
                            color: Theme.of(context).primaryColor,
                          ),
                          title: Text("Setting example"), //TODO
                          trailing: Icon(Icons.keyboard_arrow_right),
                          onTap: () {
                            //TODO
                          },
                        ),
                        _buildDivider(),
                        SwitchListTile(
                          secondary: Icon(
                            Icons.person_add,
                            color: Theme.of(context).primaryColor,
                          ),
                          activeColor: Theme.of(context).primaryColor,
                          value: true, //TODO
                          title: Text("Setting example"), //TODO
                          onChanged: (bool value) {
                            //TODO
                          },
                        ),
                        _buildDivider(),
                        CheckboxListTile(
                          secondary: Icon(
                            Icons.logout,
                            color: Theme.of(context).primaryColor,
                          ),
                          value: false, //TODO
                          title: Text("Setting example"), //TODO
                          onChanged: (bool value) {
                            //TODO
                          },
                        ),
                        _buildDivider(),
                        ListTile(
                          leading: Icon(
                            Icons.logout,
                            color: Theme.of(context).primaryColor,
                          ),
                          title: Text("Setting example"), //TODO
                          trailing: Icon(Icons.keyboard_arrow_right),
                          onTap: () {
                            //TODO
                          },
                        ),
                        _buildDivider(),
                        ListTile(
                          leading: Icon(
                            Icons.logout,
                            color: Theme.of(context).primaryColor,
                          ),
                          title: Text("Setting example"), //TODO
                          trailing: Icon(Icons.keyboard_arrow_right),
                          onTap: () {
                            //TODO
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 110,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _buildDivider() {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      width: double.infinity,
      height: 1.0,
      color: Colors.grey.shade400,
    );
  }
}
