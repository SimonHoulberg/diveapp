import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DiveLogPage extends StatefulWidget {
  @override
  _DiveLogPageState createState() => _DiveLogPageState();
}

class _DiveLogPageState extends State<DiveLogPage> {
  int logSize = 0;

  Future<String> getData() async {
    var response = await http.get("http://localhost:5000/dives");
    return response.body;
  }

  @override
  void initState() {
    super.initState();
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

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          // if loading return indicator
          if (snapshot.connectionState == ConnectionState.waiting) {
            print("waiting");
            return CircularProgressIndicator();
          }
          // if loaded return view
          if (snapshot.hasData) {
            Map<String, dynamic> data = jsonDecode(snapshot.data);
            var dives = data['dives'];

            // size of dives object
            logSize = dives.length;

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
                                var diveObj = dives[index];
                                var dive = diveObj['dive'];

                                print(dive);

                                return Card(
                                  elevation: 4.0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0)),
                                  child: Column(
                                    children: <Widget>[
                                      ListTile(
                                        title: Text('${dive['sessionID']}'),
                                      ),
                                      _buildDivider(),
                                      ListTile(
                                        title: Text('${dive['name']}'),
                                      ),
                                      _buildDivider(),
                                      ListTile(
                                        title: Text('${dive['location']}'),
                                      ),
                                      _buildDivider(),
                                      ListTile(
                                          leading: Icon(
                                            Icons.date_range,
                                            color:
                                                Theme.of(context).primaryColor,
                                          ),
                                          title: Text('${dive['date']}'),
                                          trailing:
                                              Icon(Icons.keyboard_arrow_right),
                                          onTap: () {
                                            // Show PopUp
                                            // showDialog(
                                            //     context: context,
                                            //     child: GraphCard());
                                          }),
                                    ],
                                  ),
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) =>
                                      const Divider(height: 10),
                            ),
                          ),
                        ),
                      ],
                    )
                  : Center(child: const Text('No dive log found')),
            );
          }

          // if both falase then return container
          return Container();
        });
  }
}
