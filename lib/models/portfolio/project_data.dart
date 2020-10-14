import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iamjagni/models/firebase/serialization.dart';
import 'package:iamjagni/models/portfolio/project_url.dart';
import 'package:json_annotation/json_annotation.dart';
part 'project_data.g.dart';

@JsonSerializable(explicitToJson: true)
class ProjectData {
  final String title;
  final String iconUrl;

  final List<String> screenshots;
  final List<ProjectURL> urls;
  final List<String> tech;

  @JsonKey(fromJson: SerializationHelper.formatFirebaseText)
  final String description;

  @JsonKey(
      toJson: SerializationHelper.dateTimeAsIs,
      fromJson: SerializationHelper.dateTimeFromTimestamp)
  final DateTime date;

  ProjectData(this.title, this.iconUrl, this.screenshots, this.description,
      this.urls, this.tech, this.date);
  factory ProjectData.fromJson(Map<String, dynamic> json) =>
      _$ProjectDataFromJson(json);
  Map<String, dynamic> toJson() => _$ProjectDataToJson(this);
}
