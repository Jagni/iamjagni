import 'package:json_annotation/json_annotation.dart';
part 'data.g.dart';

@JsonSerializable()
class ProfileData {
  final String name;
  final String photo;
  final String description;

  ProfileData(this.name, this.photo, this.description);
  factory ProfileData.fromJson(Map<String, dynamic> json) =>
      _$ProfileDataFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileDataToJson(this);
}
