import 'package:json_annotation/json_annotation.dart';
part 'newsChartModel.g.dart';

@JsonSerializable()
class NewsChartModel {
  @JsonKey()
  late String tanggal;
  @JsonKey()
  late int total;

  NewsChartModel(this.tanggal, this.total);

  factory NewsChartModel.fromJson(Map<String, dynamic> json) =>
      _$NewsChartModelFromJson(json);

  Map<String, dynamic> toJson() => _$NewsChartModelToJson(this);
}
