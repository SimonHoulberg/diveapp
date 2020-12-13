// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Attendee _$AttendeeFromJson(Map<String, dynamic> json) {
  return Attendee(
    json['userID'] as String,
    json['deviceID'] as String,
    json['userName'] as String,
  )
    ..maxDepth = json['maxDepth'] as String
    ..duration = json['duration'] as String
    ..entries = (json['entries'] as List)
        ?.map((e) =>
            e == null ? null : DiveEntry.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$AttendeeToJson(Attendee instance) => <String, dynamic>{
      'userID': instance.userID,
      'deviceID': instance.deviceID,
      'userName': instance.userName,
      'maxDepth': instance.maxDepth,
      'duration': instance.duration,
      'entries': instance.entries?.map((e) => e?.toJson())?.toList(),
    };
