import 'package:flutter/foundation.dart';

import 'package:diveapp/models/user.dart';

class DiveDevice {
  //Add fields as required
  String deviceID;
  String name;
  User connectedUser;

  //Parameters
  String coordinates, status, time;
  int depth, bottomDive;

  DiveDevice(@required this.deviceID, this.name, this.connectedUser);

  dynamic getParameter(String param) {
    switch (param) {
      case 'Depth':
        return this.depth.toString().padLeft(2, "0");
        break;
      case 'Bottom':
        return this.bottomDive;
        break;
      case 'Coordinates':
        return this.coordinates;
        break;
      case 'Time':
        return this.time;
        break;
      case 'Status':
        return this.status;
        break;
      default:
        return 'Invalid parameter requested from dive device';
        break;
    }
  }
}
