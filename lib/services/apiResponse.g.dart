// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apiResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResponse _$ApiResponseFromJson(Map<String, dynamic> json) {
  return ApiResponse()
    ..message = json['message'] as String
    ..status = json['status'] as int
    ..data = json['data'] as List<dynamic>;
}

Map<String, dynamic> _$ApiResponseToJson(ApiResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'data': instance.data,
    };
