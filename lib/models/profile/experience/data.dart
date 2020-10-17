import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iamjagni/models/firebase/serialization.dart';
import 'package:json_annotation/json_annotation.dart';
part 'data.g.dart';

@JsonSerializable()
class ExperienceData {
  final String title;
  final String icon;
  final int priority;

  @JsonKey(
      toJson: SerializationHelper.dateTimeAsIs,
      fromJson: SerializationHelper.dateTimeFromTimestamp)
  final DateTime startDate;

  @JsonKey(
      toJson: SerializationHelper.dateTimeAsIs,
      fromJson: SerializationHelper.dateTimeFromTimestamp)
  final DateTime finishDate;

  ExperienceData(this.startDate, this.finishDate,
      {this.title, this.icon, this.priority});

  factory ExperienceData.fromJson(Map<String, dynamic> json) =>
      _$ExperienceDataFromJson(json);
  Map<String, dynamic> toJson() => _$ExperienceDataToJson(this);
}
