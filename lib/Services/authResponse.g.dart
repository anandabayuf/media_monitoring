// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthResponse _$AuthResponseFromJson(Map<String, dynamic> json) {
  return AuthResponse()
    ..message = json['message'] as String
    ..status = json['status'] as int
    ..data = json['data'] as Map<String, dynamic>;
}

Map<String, dynamic> _$AuthResponseToJson(AuthResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'data': instance.data,
    };
