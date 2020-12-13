// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dive_device.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DiveDevice _$DiveDeviceFromJson(Map<String, dynamic> json) {
  return DiveDevice(
    json['deviceID'] as String,
    json['name'] as String,
    json['connectedUser'] == null
        ? null
        : User.fromJson(json['connectedUser'] as Map<String, dynamic>),
  )
    ..coordinates = json['coordinates'] as String
    ..status = json['status'] as String
    ..time = json['time'] as String
    ..depth = json['depth'] as int
    ..bottomDive = json['bottomDive'] as int;
}

Map<String, dynamic> _$DiveDeviceToJson(DiveDevice instance) =>
    <String, dynamic>{
      'deviceID': instance.deviceID,
      'name': instance.name,
      'connectedUser': instance.connectedUser?.toJson(),
      'coordinates': instance.coordinates,
      'status': instance.status,
      'time': instance.time,
      'depth': instance.depth,
      'bottomDive': instance.bottomDive,
    };
