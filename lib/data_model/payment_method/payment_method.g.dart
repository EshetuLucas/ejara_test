// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_method.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaymentMethodModelImpl _$$PaymentMethodModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PaymentMethodModelImpl(
      id: json['id'] as int,
      title_en: json['title_en'] as String,
      mini_amount: json['mini_amount'] as int?,
      code: json['code'] as String?,
      title_fr: json['title_fr'] as String?,
      icon: json['icon'] as String?,
      description_en: json['description_en'] as String?,
      description_fr: json['description_fr'] as String?,
    );

Map<String, dynamic> _$$PaymentMethodModelImplToJson(
        _$PaymentMethodModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title_en': instance.title_en,
      'mini_amount': instance.mini_amount,
      'code': instance.code,
      'title_fr': instance.title_fr,
      'icon': instance.icon,
      'description_en': instance.description_en,
      'description_fr': instance.description_fr,
    };
