// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserProfileDtoImpl _$$UserProfileDtoImplFromJson(Map<String, dynamic> json) =>
    _$UserProfileDtoImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      email: json['email'] as String,
      avatar: json['avatar'] as String,
      role: json['role'] as String,
    );

Map<String, dynamic> _$$UserProfileDtoImplToJson(
  _$UserProfileDtoImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'email': instance.email,
  'avatar': instance.avatar,
  'role': instance.role,
};
