import 'package:json_annotation/json_annotation.dart';
part "userModel.g.dart";

@JsonSerializable()
class UserModel {
  @JsonKey()
  late String token;
  @JsonKey()
  late String role;
  @JsonKey()
  late String name;
  @JsonKey()
  late int id;
  @JsonKey()
  late String email;

  UserModel();

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
