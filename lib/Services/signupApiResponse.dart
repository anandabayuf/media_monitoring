import 'package:json_annotation/json_annotation.dart';
part 'signupApiResponse.g.dart';

@JsonSerializable()
class SignupApiResponse {
  @JsonKey(name: "message")
  late String message;
  @JsonKey(name: "status")
  late int status;

  SignupApiResponse();

  factory SignupApiResponse.fromJson(Map<String, dynamic> json) =>
      _$SignupApiResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SignupApiResponseToJson(this);
}
