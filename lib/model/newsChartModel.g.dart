// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'newsChartModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsChartModel _$NewsChartModelFromJson(Map<String, dynamic> json) {
  return NewsChartModel(
    json['date'] as String,
    json['total'] as int,
  );
}

Map<String, dynamic> _$NewsChartModelToJson(NewsChartModel instance) =>
    <String, dynamic>{
      'date': instance.date,
      'total': instance.total,
    };
