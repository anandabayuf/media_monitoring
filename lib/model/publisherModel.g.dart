// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'publisherModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PublisherModel _$PublisherModelFromJson(Map<String, dynamic> json) {
  return PublisherModel()
    ..publisher = json['publisher'] as String
    ..iconDirectory = json['iconDirectory'] as String
    ..total = json['total'] as int;
}

Map<String, dynamic> _$PublisherModelToJson(PublisherModel instance) =>
    <String, dynamic>{
      'publisher': instance.publisher,
      'iconDirectory': instance.iconDirectory,
      'total': instance.total,
    };
