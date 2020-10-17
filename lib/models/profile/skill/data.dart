import 'package:json_annotation/json_annotation.dart';
part 'data.g.dart';

@JsonSerializable()
class SkillData {
  final String title;
  final String icon;
  final int priority;

  SkillData({this.title, this.icon, this.priority});

  factory SkillData.fromJson(Map<String, dynamic> json) =>
      _$SkillDataFromJson(json);
  Map<String, dynamic> toJson() => _$SkillDataToJson(this);
}
