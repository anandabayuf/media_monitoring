import 'package:json_annotation/json_annotation.dart';
part "tokenModel.g.dart";

@JsonSerializable()
class TokenModel {
  @JsonKey()
  late String token;

  TokenModel();

  factory TokenModel.fromJson(Map<String, dynamic> json) =>
      _$TokenModelFromJson(json);

  Map<String, dynamic> toJson() => _$TokenModelToJson(this);
}
