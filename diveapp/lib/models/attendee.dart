import 'dive_entry.dart';

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
}
