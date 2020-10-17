// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileData _$ProfileDataFromJson(Map<String, dynamic> json) {
  return ProfileData(
    json['name'] as String,
    json['photo'] as String,
    json['description'] as String,
  );
}

Map<String, dynamic> _$ProfileDataToJson(ProfileData instance) =>
    <String, dynamic>{
      'name': instance.name,
      'photo': instance.photo,
      'description': instance.description,
    };
