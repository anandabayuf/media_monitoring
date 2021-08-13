// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loginApiResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginApiResponse _$LoginApiResponseFromJson(Map<String, dynamic> json) {
  return LoginApiResponse()
    ..message = json['message'] as String
    ..status = json['status'] as int
    ..data = json['data'] as Map<String, dynamic>;
}

Map<String, dynamic> _$LoginApiResponseToJson(LoginApiResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'data': instance.data,
    };
