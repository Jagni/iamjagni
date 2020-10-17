import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iamjagni/models/firebase/serialization.dart';
import 'package:json_annotation/json_annotation.dart';
part 'data.g.dart';

@JsonSerializable()
class EducationData {
  final String title;
  final String institution;
  final String institutionImage;
  final int priority;

  @JsonKey(
      toJson: SerializationHelper.dateTimeAsIs,
      fromJson: SerializationHelper.dateTimeFromTimestamp)
  final DateTime startDate;

  @JsonKey(
      toJson: SerializationHelper.dateTimeAsIs,
      fromJson: SerializationHelper.dateTimeFromTimestamp)
  final DateTime finishDate;

  EducationData(this.title, this.institution, this.priority, this.startDate,
      this.finishDate, this.institutionImage);
  factory EducationData.fromJson(Map<String, dynamic> json) =>
      _$EducationDataFromJson(json);
  Map<String, dynamic> toJson() => _$EducationDataToJson(this);
}
