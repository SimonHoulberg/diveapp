import 'package:json_annotation/json_annotation.dart';

part 'dive_entry.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable(explicitToJson: true)
class DiveEntry {
  //Add fields as required
  String timeStamp, depth, bottom, coordinates, time, status;

  //Parameters

  DiveEntry(this.timeStamp, this.depth, this.bottom, this.coordinates,
      this.time, this.status);

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory DiveEntry.fromJson(Map<String, dynamic> json) =>
      _$DiveEntryFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$DiveEntryToJson(this);
}
