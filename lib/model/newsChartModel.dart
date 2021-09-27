import 'package:json_annotation/json_annotation.dart';
part 'newsChartModel.g.dart';

@JsonSerializable()
class NewsChartModel {
  @JsonKey()
  late String date;
  @JsonKey()
  late int total;

  NewsChartModel(this.date, this.total);

  factory NewsChartModel.fromJson(Map<String, dynamic> json) =>
      _$NewsChartModelFromJson(json);

  Map<String, dynamic> toJson() => _$NewsChartModelToJson(this);
}
