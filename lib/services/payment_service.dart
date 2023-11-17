import 'package:ejara_test/api/payment/payment_apis.dart';
import 'package:ejara_test/app/app.locator.dart';
import 'package:ejara_test/app/app.logger.dart';
import 'package:ejara_test/data_model/payment_method/payment_method.dart';
import 'package:ejara_test/data_model/payment_setting/payment_setting.dart';

class PaymentService {
  final log = getLogger('PaymentService');
  final _paymentApis = locator<PaymentApis>();

  Future<List<PaymentMethodModel>> getPaymentMethods({
    required String countryCode,
    required String transactionType,
  }) async {
    return await _paymentApis.getPaymentMethods(
        countryCode: countryCode, transactionType: transactionType);
  }

  Future<List<PaymentSettingModel>> getPaymentSettingsByType({
    required String paymentTypeId,
    required String countryCode,
    required String transactionType,
  }) async {
    return await _paymentApis.getPaymentSettingsByType(
      paymentTypeId: paymentTypeId,
      countryCode: countryCode,
      transactionType: transactionType,
      
    );
  }
}
