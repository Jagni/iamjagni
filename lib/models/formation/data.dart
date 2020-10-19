import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iamjagni/models/firebase/serialization.dart';
import 'package:json_annotation/json_annotation.dart';
part 'data.g.dart';

@JsonSerializable()
class FormationData {
  final String title;
  @JsonKey(fromJson: SerializationHelper.formatFirebaseText)
  final String subtitle;
  @JsonKey(fromJson: SerializationHelper.formatFirebaseText)
  final String subsubtitle;
  final String institution;
  final String icon;

  @JsonKey(fromJson: SerializationHelper.formatFirebaseText)
  final String description;

  @JsonKey(
      toJson: SerializationHelper.dateTimeAsIs,
      fromJson: SerializationHelper.dateTimeFromTimestamp)
  final DateTime startDate;

  @JsonKey(
      toJson: SerializationHelper.dateTimeAsIs,
      fromJson: SerializationHelper.dateTimeFromTimestamp)
  final DateTime finishDate;

  FormationData(this.title, this.institution, this.startDate, this.finishDate,
      this.icon, this.description, this.subtitle, this.subsubtitle);
  factory FormationData.fromJson(Map<String, dynamic> json) =>
      _$FormationDataFromJson(json);
  Map<String, dynamic> toJson() => _$FormationDataToJson(this);
}
