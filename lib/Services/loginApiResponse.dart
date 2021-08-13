import 'package:json_annotation/json_annotation.dart';
part 'loginApiResponse.g.dart';

@JsonSerializable()
class LoginApiResponse {
  @JsonKey(name: "message")
  late String message;
  @JsonKey(name: "status")
  late int status;
  @JsonKey(name: "data")
  late Map<String, dynamic> data;

  LoginApiResponse();

  factory LoginApiResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginApiResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LoginApiResponseToJson(this);
}
