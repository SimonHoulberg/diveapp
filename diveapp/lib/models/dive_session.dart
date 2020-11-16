import 'package:diveapp/models/attendee.dart';
import 'package:diveapp/models/user.dart';

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
}
