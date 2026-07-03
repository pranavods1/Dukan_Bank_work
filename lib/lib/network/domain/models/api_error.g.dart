// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ApiErrorImpl _$$ApiErrorImplFromJson(Map<String, dynamic> json) =>
    _$ApiErrorImpl(
      code: json['code'],
      description: json['description'] as String?,
      mwCode: json['mwCode'] as String?,
      mwdesc: json['mwdesc'] as String?,
    );

Map<String, dynamic> _$$ApiErrorImplToJson(_$ApiErrorImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'description': instance.description,
      'mwCode': instance.mwCode,
      'mwdesc': instance.mwdesc,
    };
