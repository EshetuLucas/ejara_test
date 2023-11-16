import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_setting.freezed.dart';
part 'payment_setting.g.dart';

@freezed
class PaymentSettingModel with _$PaymentSettingModel {
  PaymentSettingModel._();
  factory PaymentSettingModel({
    String? name,
    String? id,
  }) = _PaymentSettingModel;

  factory PaymentSettingModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentSettingModelFromJson(json);
}
