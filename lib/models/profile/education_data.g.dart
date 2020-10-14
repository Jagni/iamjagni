// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'education_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EducationData _$EducationDataFromJson(Map<String, dynamic> json) {
  return EducationData(
    json['title'] as String,
    json['institution'] as String,
    json['priority'] as int,
    SerializationHelper.dateTimeFromTimestamp(json['startDate'] as Timestamp),
    SerializationHelper.dateTimeFromTimestamp(json['finishDate'] as Timestamp),
  );
}

Map<String, dynamic> _$EducationDataToJson(EducationData instance) =>
    <String, dynamic>{
      'title': instance.title,
      'institution': instance.institution,
      'priority': instance.priority,
      'startDate': SerializationHelper.dateTimeAsIs(instance.startDate),
      'finishDate': SerializationHelper.dateTimeAsIs(instance.finishDate),
    };
