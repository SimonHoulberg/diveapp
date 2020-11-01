import 'package:flutter/material.dart';
import 'package:diveapp/widgets/graph_card.dart';

class DiveLogColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DateTime today = new DateTime.now();
    String dateFormatted =
        "${today.year.toString()}-${today.month.toString().padLeft(2, '0')}-${today.day.toString().padLeft(2, '0')} ${today.hour.toString().padLeft(2, '0')}:${today.minute.toString().padLeft(2, '0')}:${today.second.toString().padLeft(2, '0')}";

    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text("Dive number example"), //TODO
          ),
          _buildDivider(),
          ListTile(
              leading: Icon(
                Icons.date_range,
                color: Theme.of(context).primaryColor,
              ),
              title: Text(
                dateFormatted,
              ),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                // Show PopUp
                showDialog(context: context, child: GraphCard());
              }),
        ],
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
