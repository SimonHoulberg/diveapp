import 'package:json_annotation/json_annotation.dart';

import 'dive_entry.dart';

part 'attendee.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable(explicitToJson: true)
class Attendee {
  //Add fields as required
  String userID;
  String deviceID;
  String userName;
  String maxDepth;
  String duration;

  //Parameters
  List<DiveEntry> entries = [];

  Attendee(this.userID, this.deviceID, this.userName);

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory Attendee.fromJson(Map<String, dynamic> json) =>
      _$AttendeeFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$AttendeeToJson(this);
}
