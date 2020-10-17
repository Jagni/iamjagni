// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExperienceData _$ExperienceDataFromJson(Map<String, dynamic> json) {
  return ExperienceData(
    SerializationHelper.dateTimeFromTimestamp(json['startDate'] as Timestamp),
    SerializationHelper.dateTimeFromTimestamp(json['finishDate'] as Timestamp),
    title: json['title'] as String,
    icon: json['icon'] as String,
    priority: json['priority'] as int,
  );
}

Map<String, dynamic> _$ExperienceDataToJson(ExperienceData instance) =>
    <String, dynamic>{
      'title': instance.title,
      'icon': instance.icon,
      'priority': instance.priority,
      'startDate': SerializationHelper.dateTimeAsIs(instance.startDate),
      'finishDate': SerializationHelper.dateTimeAsIs(instance.finishDate),
    };
