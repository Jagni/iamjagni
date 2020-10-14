import 'package:json_annotation/json_annotation.dart';
part 'profile_data.g.dart';

@JsonSerializable()
class ProfileData {
  final String name;
  final String photo;
  final String role;
  final String description;

  ProfileData(this.name, this.photo, this.role, this.description);
  factory ProfileData.fromJson(Map<String, dynamic> json) =>
      _$ProfileDataFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileDataToJson(this);
}
