// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    name: json['name'] as String,
    email: json['email'] as String,
    password: json['password'] as String,
  )..userID = json['userID'] as String;
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'userID': instance.userID,
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
    };
