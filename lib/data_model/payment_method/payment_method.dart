import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_method.freezed.dart';
part 'payment_method.g.dart';

@freezed
class PaymentMethodModel with _$PaymentMethodModel {
  PaymentMethodModel._();
  factory PaymentMethodModel({
    required int id,
    required String title_en,
    int? mini_amount,
    String? code,
    String? title_fr,
    String? icon,
    String? description_en,
    String? description_fr,
  }) = _PaymentMethodModel;

  factory PaymentMethodModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentMethodModelFromJson(json);
}

List<PaymentMethodModel> get fakePaymentMethods => [
      PaymentMethodModel(
        id: 1,
        title_en: 'Fake Payment method ',
        description_en: 'description_en 1',
      ),
      PaymentMethodModel(
        id: 1,
        title_en: 'Fake Payment method title 1',
        description_en: 'description_en',
      ),
      PaymentMethodModel(
        id: 1,
        title_en: 'Fake Payment method title 1',
        description_en: 'description',
      ),
      PaymentMethodModel(
        id: 1,
        title_en: 'Payment method title 1',
        description_en: 'description_en ',
      ),
      PaymentMethodModel(
        id: 1,
        title_en: 'Fake Payment method title 1',
        description_en: 'description_en',
      ),
    ];
