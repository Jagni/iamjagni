import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iamjagni/models/firebase/serialization.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
part 'data.g.dart';

@JsonSerializable()
class ExperienceData {
  final String title;
  final String icon;

  @JsonKey(fromJson: SerializationHelper.formatFirebaseText)
  final String description;

  final String institution;

  @JsonKey(
      toJson: SerializationHelper.dateTimeAsIs,
      fromJson: SerializationHelper.dateTimeFromTimestamp)
  final DateTime startDate;

  @JsonKey(
      toJson: SerializationHelper.dateTimeAsIs,
      fromJson: SerializationHelper.dateTimeFromTimestamp)
  final DateTime finishDate;

  String get dateString {
    final formatter = DateFormat('MMM/yy');
    final formattedStart = formatter.format(startDate);
    var formattedEnd = 'Atual';
    if (finishDate != null) {
      formattedEnd = formatter.format(finishDate);
    }
    return formattedStart + ' - ' + formattedEnd;
  }

  ExperienceData(
      this.startDate, this.finishDate, this.description, this.institution,
      {this.title, this.icon});

  factory ExperienceData.fromJson(Map<String, dynamic> json) =>
      _$ExperienceDataFromJson(json);
  Map<String, dynamic> toJson() => _$ExperienceDataToJson(this);
}
