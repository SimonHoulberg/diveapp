// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dive_session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DiveSession _$DiveSessionFromJson(Map<String, dynamic> json) {
  return DiveSession(
    json['sessionID'] as String,
    json['name'] as String,
    json['location'] as String,
    json['date'] as String,
    (json['attending'] as List)
        ?.map((e) =>
            e == null ? null : Attendee.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DiveSessionToJson(DiveSession instance) =>
    <String, dynamic>{
      'sessionID': instance.sessionID,
      'name': instance.name,
      'location': instance.location,
      'date': instance.date,
      'attending': instance.attending?.map((e) => e?.toJson())?.toList(),
    };
