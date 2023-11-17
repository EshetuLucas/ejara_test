import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_setting.freezed.dart';
part 'payment_setting.g.dart';

@freezed
class PaymentSettingModel with _$PaymentSettingModel {
  PaymentSettingModel._();
  factory PaymentSettingModel({
    required int id,
    required String title_en,
    String? description_en,
    String? code,
    String? title_fr,
  }) = _PaymentSettingModel;

  factory PaymentSettingModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentSettingModelFromJson(json);
}

List<PaymentSettingModel> get fakePaymentSettings => [
      PaymentSettingModel(
          id: 1, title_en: 'Orange Money', description_en: '979799'),
      PaymentSettingModel(
          id: 2, title_en: 'Orange Money', description_en: '979799'),
      PaymentSettingModel(
          id: 3, title_en: 'Orange Money', description_en: '979799'),
      PaymentSettingModel(
          id: 4, title_en: 'Orange Money', description_en: '979799'),
    ];
