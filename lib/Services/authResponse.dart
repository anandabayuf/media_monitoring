import 'package:json_annotation/json_annotation.dart';
part 'authResponse.g.dart';

@JsonSerializable()
class AuthResponse {
  @JsonKey(name: "message")
  late String message;
  @JsonKey(name: "status")
  late int status;
  @JsonKey(name: "data")
  late Map<String, dynamic> data;

  AuthResponse();

  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);
  Map<String, dynamic> toJson() => _$AuthResponseToJson(this);
}
