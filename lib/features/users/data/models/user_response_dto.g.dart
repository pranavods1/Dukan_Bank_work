// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserResponseDtoImpl _$$UserResponseDtoImplFromJson(
  Map<String, dynamic> json,
) => _$UserResponseDtoImpl(
  users: (json['users'] as List<dynamic>?)
      ?.map((e) => UserDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$UserResponseDtoImplToJson(
  _$UserResponseDtoImpl instance,
) => <String, dynamic>{'users': instance.users};
