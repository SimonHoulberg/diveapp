import 'package:flutter/material.dart';

class DiveLogInfoPage extends StatefulWidget {
  @override
  _DiveLogInfoPageState createState() => _DiveLogInfoPageState();
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

class _DiveLogInfoPageState extends State<DiveLogInfoPage> {
  // variables to be replaced with database info
  String diveName = "name",
      divelocation = "Location",
      divedate = "date",
      overviewMaxDepth = "Max depth",
      overviewDiveTime = "Dive Time",
      overviewGas = "Gas",
      overviewAvgDepth = "AvgDepth",
      overviewSurfaceInterval = "SurInt",
      overviewWater = "Water",
      conditionsAirTemp = "Atemp",
      conditionsWaterTemp = "Wtemp",
      conditionsWind = "Wind",
      conditionsCurrent = "Current";

  bool wetsuitBool = false,
      cameraBool = true,
      knifeBool = true,
      reBreatherBool = false;

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        color: Colors.white60,
        child: Column(
          children: [
            //Title (name of dive)
            Container(
              padding: EdgeInsets.fromLTRB(16, 16, 0, 16),
              alignment: Alignment.centerLeft,
              child: Text(
                diveName,
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Theme.of(context).primaryColor, fontSize: 20),
              ),
            ),
            //Row for location and date
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 16,
                    ),
                    Icon(
                      Icons.location_on_rounded,
                      color: Theme.of(context).primaryColor,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(divelocation),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.date_range,
                      color: Theme.of(context).primaryColor,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(divedate),
                    SizedBox(
                      width: 16,
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            _buildDivider(),
            SizedBox(
              height: 16,
            ),
            //Overview section (title and 2 rows)
            Text("Overview",
                style: TextStyle(
                    color: Theme.of(context).primaryColor, fontSize: 20)),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      overviewMaxDepth,
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Max depth",
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      overviewDiveTime,
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Dive time",
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      overviewGas,
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Gas",
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      overviewAvgDepth,
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Avg. depth",
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      overviewSurfaceInterval,
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Surface interval",
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      overviewWater,
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Water",
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            _buildDivider(),
            SizedBox(
              height: 16,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Equipment checklist
                Column(children: [
                  Text(
                    "Equipment",
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  // Checkboxes for equipment
                  Row(children: [
                    Icon(
                      wetsuitBool
                          ? Icons.check_box_outlined
                          : Icons.check_box_outline_blank_rounded,
                      color: Theme.of(context).primaryColor,
                    ),
                    Text("Wetsuit")
                  ]),
                  SizedBox(
                    height: 8,
                  ),
                  Row(children: [
                    Icon(
                      cameraBool
                          ? Icons.check_box_outlined
                          : Icons.check_box_outline_blank_rounded,
                      color: Theme.of(context).primaryColor,
                    ),
                    Text("Camera")
                  ]),
                  SizedBox(
                    height: 8,
                  ),
                  Row(children: [
                    Icon(
                      knifeBool
                          ? Icons.check_box_outlined
                          : Icons.check_box_outline_blank_rounded,
                      color: Theme.of(context).primaryColor,
                    ),
                    Text("Knife")
                  ]),
                  SizedBox(
                    height: 8,
                  ),
                  Row(children: [
                    Icon(
                      reBreatherBool
                          ? Icons.check_box_outlined
                          : Icons.check_box_outline_blank_rounded,
                      color: Theme.of(context).primaryColor,
                    ),
                    Text("Re-breather")
                  ]),
                ]),
                // Conditions list
                Column(children: [
                  Text("Conditions",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 16,
                  ),
                  Row(children: [
                    Text("Air temp. "),
                    Text(
                      conditionsAirTemp,
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    )
                  ]),
                  SizedBox(
                    height: 8,
                  ),
                  Row(children: [
                    Text("Water temp. "),
                    Text(
                      conditionsWaterTemp,
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    )
                  ]),
                  SizedBox(
                    height: 8,
                  ),
                  Row(children: [
                    Text("Wind "),
                    Text(
                      conditionsWind,
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    )
                  ]),
                  SizedBox(
                    height: 8,
                  ),
                  Row(children: [
                    Text("Current "),
                    Text(
                      conditionsCurrent,
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    )
                  ]),
                ])
              ],
            )
          ],
        ));
  }
}
