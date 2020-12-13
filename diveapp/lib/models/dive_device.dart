import 'package:flutter/foundation.dart';
import 'package:diveapp/models/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dive_device.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable(explicitToJson: true)
class DiveDevice {
  //Add fields as required
  String deviceID;
  String name;
  User connectedUser;

  //Parameters
  String coordinates, status, time;
  int depth, bottomDive;

  DiveDevice(@required this.deviceID, this.name, this.connectedUser);

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory DiveDevice.fromJson(Map<String, dynamic> json) =>
      _$DiveDeviceFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$DiveDeviceToJson(this);

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
