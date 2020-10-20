// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectData _$ProjectDataFromJson(Map<String, dynamic> json) {
  return ProjectData(
    json['title'] as String,
    json['iconUrl'] as String,
    (json['screenshots'] as List)?.map((e) => e as String)?.toList(),
    SerializationHelper.formatFirebaseText(json['description'] as String),
    (json['urls'] as List)
        ?.map((e) =>
            e == null ? null : ProjectURL.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['tech'] as List)?.map((e) => e as String)?.toList(),
    SerializationHelper.dateTimeFromTimestamp(json['date'] as Timestamp),
    (json['priority'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$ProjectDataToJson(ProjectData instance) =>
    <String, dynamic>{
      'title': instance.title,
      'iconUrl': instance.iconUrl,
      'priority': instance.priority,
      'screenshots': instance.screenshots,
      'urls': instance.urls?.map((e) => e?.toJson())?.toList(),
      'tech': instance.tech,
      'description': instance.description,
      'date': SerializationHelper.dateTimeAsIs(instance.date),
    };
