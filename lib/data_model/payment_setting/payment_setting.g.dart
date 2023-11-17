// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_setting.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaymentSettingModelImpl _$$PaymentSettingModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PaymentSettingModelImpl(
      id: json['id'] as int,
      title_en: json['title_en'] as String,
      description_en: json['description_en'] as String?,
      code: json['code'] as String?,
      title_fr: json['title_fr'] as String?,
    );

Map<String, dynamic> _$$PaymentSettingModelImplToJson(
        _$PaymentSettingModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title_en': instance.title_en,
      'description_en': instance.description_en,
      'code': instance.code,
      'title_fr': instance.title_fr,
    };
