// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'newsModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsModel _$NewsModelFromJson(Map<String, dynamic> json) {
  return NewsModel()
    ..author = json['author'] as String
    ..title = json['title'] as String
    ..description = json['description'] as String
    ..content = json['content'] as String
    ..url = json['url'] as String
    ..publisher = json['publisher'] as String
    ..urlToImage = json['urlToImage'] as String
    ..publishedAt = json['publishedAt'] as String
    ..category = json['category'] as String;
}

Map<String, dynamic> _$NewsModelToJson(NewsModel instance) => <String, dynamic>{
      'author': instance.author,
      'title': instance.title,
      'description': instance.description,
      'content': instance.content,
      'url': instance.url,
      'publisher': instance.publisher,
      'urlToImage': instance.urlToImage,
      'publishedAt': instance.publishedAt,
      'category': instance.category,
    };
