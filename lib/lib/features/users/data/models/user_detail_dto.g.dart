// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_detail_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserDetailDtoImpl _$$UserDetailDtoImplFromJson(Map<String, dynamic> json) =>
    _$UserDetailDtoImpl(
      id: (json['id'] as num?)?.toInt(),
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      image: json['image'] as String?,
      age: (json['age'] as num?)?.toInt(),
      gender: json['gender'] as String?,
      phone: json['phone'] as String?,
      university: json['university'] as String?,
    );

Map<String, dynamic> _$$UserDetailDtoImplToJson(_$UserDetailDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'image': instance.image,
      'age': instance.age,
      'gender': instance.gender,
      'phone': instance.phone,
      'university': instance.university,
    };
