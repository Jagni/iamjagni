// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SkillData _$SkillDataFromJson(Map<String, dynamic> json) {
  return SkillData(
    title: json['title'] as String,
    icon: json['icon'] as String,
    priority: json['priority'] as int,
  );
}

Map<String, dynamic> _$SkillDataToJson(SkillData instance) => <String, dynamic>{
      'title': instance.title,
      'icon': instance.icon,
      'priority': instance.priority,
    };
