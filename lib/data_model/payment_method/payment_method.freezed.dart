// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_method.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PaymentMethodModel _$PaymentMethodModelFromJson(Map<String, dynamic> json) {
  return _PaymentMethodModel.fromJson(json);
}

/// @nodoc
mixin _$PaymentMethodModel {
  int get id => throw _privateConstructorUsedError;
  String get title_en => throw _privateConstructorUsedError;
  int? get mini_amount => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  String? get title_fr => throw _privateConstructorUsedError;
  String? get icon => throw _privateConstructorUsedError;
  String? get description_en => throw _privateConstructorUsedError;
  String? get description_fr => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentMethodModelCopyWith<PaymentMethodModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentMethodModelCopyWith<$Res> {
  factory $PaymentMethodModelCopyWith(
          PaymentMethodModel value, $Res Function(PaymentMethodModel) then) =
      _$PaymentMethodModelCopyWithImpl<$Res, PaymentMethodModel>;
  @useResult
  $Res call(
      {int id,
      String title_en,
      int? mini_amount,
      String? code,
      String? title_fr,
      String? icon,
      String? description_en,
      String? description_fr});
}

/// @nodoc
class _$PaymentMethodModelCopyWithImpl<$Res, $Val extends PaymentMethodModel>
    implements $PaymentMethodModelCopyWith<$Res> {
  _$PaymentMethodModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title_en = null,
    Object? mini_amount = freezed,
    Object? code = freezed,
    Object? title_fr = freezed,
    Object? icon = freezed,
    Object? description_en = freezed,
    Object? description_fr = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title_en: null == title_en
          ? _value.title_en
          : title_en // ignore: cast_nullable_to_non_nullable
              as String,
      mini_amount: freezed == mini_amount
          ? _value.mini_amount
          : mini_amount // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      title_fr: freezed == title_fr
          ? _value.title_fr
          : title_fr // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      description_en: freezed == description_en
          ? _value.description_en
          : description_en // ignore: cast_nullable_to_non_nullable
              as String?,
      description_fr: freezed == description_fr
          ? _value.description_fr
          : description_fr // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentMethodModelImplCopyWith<$Res>
    implements $PaymentMethodModelCopyWith<$Res> {
  factory _$$PaymentMethodModelImplCopyWith(_$PaymentMethodModelImpl value,
          $Res Function(_$PaymentMethodModelImpl) then) =
      __$$PaymentMethodModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String title_en,
      int? mini_amount,
      String? code,
      String? title_fr,
      String? icon,
      String? description_en,
      String? description_fr});
}

/// @nodoc
class __$$PaymentMethodModelImplCopyWithImpl<$Res>
    extends _$PaymentMethodModelCopyWithImpl<$Res, _$PaymentMethodModelImpl>
    implements _$$PaymentMethodModelImplCopyWith<$Res> {
  __$$PaymentMethodModelImplCopyWithImpl(_$PaymentMethodModelImpl _value,
      $Res Function(_$PaymentMethodModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title_en = null,
    Object? mini_amount = freezed,
    Object? code = freezed,
    Object? title_fr = freezed,
    Object? icon = freezed,
    Object? description_en = freezed,
    Object? description_fr = freezed,
  }) {
    return _then(_$PaymentMethodModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title_en: null == title_en
          ? _value.title_en
          : title_en // ignore: cast_nullable_to_non_nullable
              as String,
      mini_amount: freezed == mini_amount
          ? _value.mini_amount
          : mini_amount // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      title_fr: freezed == title_fr
          ? _value.title_fr
          : title_fr // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      description_en: freezed == description_en
          ? _value.description_en
          : description_en // ignore: cast_nullable_to_non_nullable
              as String?,
      description_fr: freezed == description_fr
          ? _value.description_fr
          : description_fr // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentMethodModelImpl extends _PaymentMethodModel {
  _$PaymentMethodModelImpl(
      {required this.id,
      required this.title_en,
      this.mini_amount,
      this.code,
      this.title_fr,
      this.icon,
      this.description_en,
      this.description_fr})
      : super._();

  factory _$PaymentMethodModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentMethodModelImplFromJson(json);

  @override
  final int id;
  @override
  final String title_en;
  @override
  final int? mini_amount;
  @override
  final String? code;
  @override
  final String? title_fr;
  @override
  final String? icon;
  @override
  final String? description_en;
  @override
  final String? description_fr;

  @override
  String toString() {
    return 'PaymentMethodModel(id: $id, title_en: $title_en, mini_amount: $mini_amount, code: $code, title_fr: $title_fr, icon: $icon, description_en: $description_en, description_fr: $description_fr)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentMethodModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title_en, title_en) ||
                other.title_en == title_en) &&
            (identical(other.mini_amount, mini_amount) ||
                other.mini_amount == mini_amount) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.title_fr, title_fr) ||
                other.title_fr == title_fr) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.description_en, description_en) ||
                other.description_en == description_en) &&
            (identical(other.description_fr, description_fr) ||
                other.description_fr == description_fr));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title_en, mini_amount, code,
      title_fr, icon, description_en, description_fr);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentMethodModelImplCopyWith<_$PaymentMethodModelImpl> get copyWith =>
      __$$PaymentMethodModelImplCopyWithImpl<_$PaymentMethodModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentMethodModelImplToJson(
      this,
    );
  }
}

abstract class _PaymentMethodModel extends PaymentMethodModel {
  factory _PaymentMethodModel(
      {required final int id,
      required final String title_en,
      final int? mini_amount,
      final String? code,
      final String? title_fr,
      final String? icon,
      final String? description_en,
      final String? description_fr}) = _$PaymentMethodModelImpl;
  _PaymentMethodModel._() : super._();

  factory _PaymentMethodModel.fromJson(Map<String, dynamic> json) =
      _$PaymentMethodModelImpl.fromJson;

  @override
  int get id;
  @override
  String get title_en;
  @override
  int? get mini_amount;
  @override
  String? get code;
  @override
  String? get title_fr;
  @override
  String? get icon;
  @override
  String? get description_en;
  @override
  String? get description_fr;
  @override
  @JsonKey(ignore: true)
  _$$PaymentMethodModelImplCopyWith<_$PaymentMethodModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
