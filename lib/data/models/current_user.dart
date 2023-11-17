import 'package:json_annotation/json_annotation.dart';

part 'current_user.g.dart';

@JsonSerializable()
class CurrentUser {
  String? id;
  String? name;
  String? email;
  String? emailVerified;
  String? image;

  CurrentUser({
    this.id,
    this.name,
    this.email,
    this.emailVerified,
    this.image,
  });

  factory CurrentUser.fromJson(Map<String, dynamic> json) => _$CurrentUserFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentUserToJson(this);
}
