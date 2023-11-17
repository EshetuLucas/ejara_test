import 'package:ejara_test/app/app.locator.dart';
import 'package:ejara_test/app/app.logger.dart';
import 'package:ejara_test/app/app.router.dart';
import 'package:ejara_test/data_model/payment_method/payment_method.dart';
import 'package:ejara_test/data_model/payment_setting/payment_setting.dart';
import 'package:ejara_test/services/payment_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

class WalletsSheetModel extends ChangeNotifier {
  final log = getLogger('WalletsSheetModel');
  final _paymentService = locator<PaymentService>();
  final _navigationService = locator<NavigationService>();

  bool _hasError = false;
  bool get hasError => _hasError;

  bool _isBusy = false;
  bool get isBusy => _isBusy;

  PaymentSettingModel? _selectedPaymentSetting;
  PaymentSettingModel get selectedPaymentSetting => _selectedPaymentSetting!;
  bool get hasSelectedPaymentSetting => _selectedPaymentSetting != null;

  bool isPaymentSettingSelected(int paymentSettingId) =>
      hasSelectedPaymentSetting &&
      _selectedPaymentSetting!.id == paymentSettingId;

  bool get hasPaymentSettings => paymentSettings.isNotEmpty;

  void onSelectPaymentSetting(PaymentSettingModel paymentSetting) {
    _selectedPaymentSetting = paymentSetting;
    notifyListeners();
  }

  List<PaymentSettingModel> _paymentSettings = [];
  List<PaymentSettingModel> get paymentSettings =>
      isBusy ? fakePaymentSettings : _paymentSettings;

  Future<void> getPaymentSettingsByType(
    PaymentMethodModel paymentMethod,
  ) async {
    setError(false);
    setBusy(true);
    try {
      /// Using const countryCode and transactionType for testing purposes
      // _paymentMethods =
      await _paymentService.getPaymentSettingsByType(
        countryCode: 'CM',
        transactionType: 'buy',
        paymentTypeId: paymentMethod.id.toString(),
      );
    } catch (e) {
      setError(true);
      log.e('Unable to get payment methods');
    } finally {
      setBusy(false);
    }
  }

  void setError(bool value) {
    _hasError = value;
    notifyListeners();
  }

  void onClose() {
    _navigationService.back();
  }

  void disposeViewModel() {
    _selectedPaymentSetting = null;
    _paymentSettings = [];
  }

  void onConfirm() {}

  void setBusy(bool value) {
    _isBusy = value;
    notifyListeners();
  }

  void onAddAnotherMethod() async {
    _navigationService.navigateTo(
      Routes.newPaymentSettingView,
      preventDuplicates: false,
    );
  }
}
