// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

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
    json['institutionImage'] as String,
  );
}

Map<String, dynamic> _$EducationDataToJson(EducationData instance) =>
    <String, dynamic>{
      'title': instance.title,
      'institution': instance.institution,
      'institutionImage': instance.institutionImage,
      'priority': instance.priority,
      'startDate': SerializationHelper.dateTimeAsIs(instance.startDate),
      'finishDate': SerializationHelper.dateTimeAsIs(instance.finishDate),
    };
