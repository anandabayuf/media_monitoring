import 'package:json_annotation/json_annotation.dart';
part 'newsModel.g.dart';

@JsonSerializable()
class NewsModel {
  @JsonKey()
  late String author;
  @JsonKey()
  late String title;
  @JsonKey()
  late String description;
  @JsonKey()
  late String content;
  @JsonKey()
  late String url;
  @JsonKey()
  late String publisher;
  @JsonKey()
  late String urlToImage;
  @JsonKey()
  late String publishedAt;
  @JsonKey()
  late String category;

  NewsModel();

  factory NewsModel.fromJson(Map<String, dynamic> json) =>
      _$NewsModelFromJson(json);

  Map<String, dynamic> toJson() => _$NewsModelToJson(this);
}
