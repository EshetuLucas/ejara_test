import 'package:ejara_test/api/common/api_client.dart';
import 'package:ejara_test/api/common/api_consts.dart';
import 'package:ejara_test/app/app.logger.dart';
import 'package:ejara_test/data_model/payment_method/payment_method.dart';
import 'package:ejara_test/data_model/payment_setting/payment_setting.dart';

String paymentMethodsBaseUrl =
    baseUrlV2 + '/marketplace/payment-types-per-country';

String paymentSettingsBaseUrl =
    baseUrlV1 + "/customer/payment-settings-per-type";

mixin GetApis {
  final log = getLogger('UserPostApis');
  ApiClient get apiClient => ApiClient();

  Future<List<PaymentSettingModel>> getPaymentSettingsByType({
    required String paymentTypeId,
    required String countryCode,
    required String transactionType,
  }) async {
    String paymentSettingsUrl = paymentSettingsBaseUrl +
        _getPaymentSettingsUrl(
          paymentTypeId: paymentTypeId,
          countryCode: countryCode,
          transactionType: transactionType,
        );
    return await apiClient.getList<PaymentSettingModel>(
      paymentSettingsUrl,
      key: 'data',
    );
  }

  Future<List<PaymentMethodModel>> getPaymentMethods({
    required String countryCode,
    required String transactionType,
  }) async {
    String paymentMethodsUrl = paymentMethodsBaseUrl +
        _getPaymentMethodsUrl(
            countryCode: countryCode, transactionType: transactionType);
    return await apiClient.getList<PaymentMethodModel>(
      paymentMethodsUrl,
      key: 'data',
    );
  }

  String _getPaymentMethodsUrl({
    required String countryCode,
    required String transactionType,
  }) {
    String query = '?countryCode=$countryCode&transactionType=$transactionType';

    return query;
  }

  String _getPaymentSettingsUrl({
    required String paymentTypeId,
    required String countryCode,
    required String transactionType,
  }) {
    String query =
        '?paymentTypeId=$paymentTypeId&countryCode=$countryCode&transactionType=$transactionType';

    return query;
  }
}
