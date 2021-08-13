// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signupApiResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupApiResponse _$SignupApiResponseFromJson(Map<String, dynamic> json) {
  return SignupApiResponse()
    ..message = json['message'] as String
    ..status = json['status'] as int;
}

Map<String, dynamic> _$SignupApiResponseToJson(SignupApiResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
    };
