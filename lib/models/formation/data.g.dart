// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FormationData _$FormationDataFromJson(Map<String, dynamic> json) {
  return FormationData(
    json['title'] as String,
    json['institution'] as String,
    SerializationHelper.dateTimeFromTimestamp(json['startDate'] as Timestamp),
    SerializationHelper.dateTimeFromTimestamp(json['finishDate'] as Timestamp),
    json['icon'] as String,
    SerializationHelper.formatFirebaseText(json['description'] as String),
    SerializationHelper.formatFirebaseText(json['subtitle'] as String),
    SerializationHelper.formatFirebaseText(json['subsubtitle'] as String),
  );
}

Map<String, dynamic> _$FormationDataToJson(FormationData instance) =>
    <String, dynamic>{
      'title': instance.title,
      'subtitle': instance.subtitle,
      'subsubtitle': instance.subsubtitle,
      'institution': instance.institution,
      'icon': instance.icon,
      'description': instance.description,
      'startDate': SerializationHelper.dateTimeAsIs(instance.startDate),
      'finishDate': SerializationHelper.dateTimeAsIs(instance.finishDate),
    };
