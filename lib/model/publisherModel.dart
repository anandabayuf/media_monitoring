import 'package:json_annotation/json_annotation.dart';
part 'publisherModel.g.dart';

@JsonSerializable()
class PublisherModel {
  @JsonKey()
  late String publisher;
  @JsonKey()
  late int total;

  PublisherModel();

  factory PublisherModel.fromJson(Map<String, dynamic> json) =>
      _$PublisherModelFromJson(json);

  Map<String, dynamic> toJson() => _$PublisherModelToJson(this);
}
