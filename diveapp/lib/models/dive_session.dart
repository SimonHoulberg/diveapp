import 'package:diveapp/models/attendee.dart';
import 'package:diveapp/models/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dive_session.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable(explicitToJson: true)
class DiveSession {
  //Add fields as required
  String sessionID;
  String name;
  //List<User> attendingUsers;
  String location;
  String date;

  //Parameters
  List<Attendee> attending;

  DiveSession(
      this.sessionID, this.name, this.location, this.date, this.attending);

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory DiveSession.fromJson(Map<String, dynamic> json) =>
      _$DiveSessionFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$DiveSessionToJson(this);
}
