// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return UserModel()
    ..token = json['token'] as String
    ..role = json['role'] as String
    ..name = json['name'] as String
    ..id = json['id'] as int
    ..email = json['email'] as String;
}

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'token': instance.token,
      'role': instance.role,
      'name': instance.name,
      'id': instance.id,
      'email': instance.email,
    };
