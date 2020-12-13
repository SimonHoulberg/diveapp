// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dive_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DiveEntry _$DiveEntryFromJson(Map<String, dynamic> json) {
  return DiveEntry(
    json['timeStamp'] as String,
    json['depth'] as String,
    json['bottom'] as String,
    json['coordinates'] as String,
    json['time'] as String,
    json['status'] as String,
  );
}

Map<String, dynamic> _$DiveEntryToJson(DiveEntry instance) => <String, dynamic>{
      'timeStamp': instance.timeStamp,
      'depth': instance.depth,
      'bottom': instance.bottom,
      'coordinates': instance.coordinates,
      'time': instance.time,
      'status': instance.status,
    };
