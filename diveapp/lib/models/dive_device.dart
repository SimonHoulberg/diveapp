import 'package:flutter/foundation.dart';

import 'package:diveapp/models/user.dart';

class DiveDevice {
  //Add fields as required
  String deviceID;
  String name;
  User connectedUser;

  //Parameters
  String coordinates, status;
  int depth, bottomDive, time;

  DiveDevice(@required this.deviceID, this.name, this.connectedUser);

  dynamic getParameter(String param) {
    switch (param) {
      case 'Depth':
        this.depth;
        break;
      case 'Bottom':
        this.bottomDive;
        break;
      case 'Coordinates':
        this.coordinates;
        break;
      case 'Time':
        this.time;
        break;
      case 'Status':
        this.status;
        break;
      default:
        'Invalid parameter';
        break;
    }
  }
}
