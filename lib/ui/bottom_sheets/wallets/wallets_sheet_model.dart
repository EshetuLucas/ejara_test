import 'package:ejara_test/app/app.logger.dart';
import 'package:ejara_test/app/app.router.dart';
import 'package:ejara_test/app/locator.dart';
import 'package:ejara_test/data_model/payment_method/payment_method.dart';
import 'package:ejara_test/data_model/payment_setting/payment_setting.dart';
import 'package:ejara_test/services/payment_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stacked_services/stacked_services.dart';

class WalletsSheetModel extends Cubit {
  final log = getLogger('WalletsSheetModel');
  final _paymentService = appLocator<PaymentService>();
  final _navigationService = appLocator<NavigationService>();

  bool _hasError = false;

  WalletsSheetModel(super.initialState);
  bool get hasError => _hasError;

  bool _isBusy = false;
  bool get isBusy => _isBusy;

  bool get hasSelectedPaymentSetting => _selectedPaymentSetting != null;

  bool isPaymentSettingSelected(int paymentSettingId) =>
      hasSelectedPaymentSetting &&
      _selectedPaymentSetting!.id == paymentSettingId;

  bool get hasPaymentSettings => paymentSettings.isNotEmpty;

  late PaymentMethodModel _paymentMethod;

  PaymentSettingModel? _selectedPaymentSetting;
  PaymentSettingModel get selectedPaymentSetting => _selectedPaymentSetting!;

  List<PaymentSettingModel> _paymentSettings = [];
  List<PaymentSettingModel> get paymentSettings =>
      isBusy ? fakePaymentSettings : _paymentSettings;

  void onInit(PaymentMethodModel paymentMethodModel) {
    _paymentMethod = paymentMethodModel;
    getPaymentSettingsByType();
  }

  Future<void> getPaymentSettingsByType() async {
    setError(false);
    setBusy(true);
    try {
      /// Using const countryCode and transactionType for testing purposes
      // _paymentMethods =
      await _paymentService.getPaymentSettingsByType(
        countryCode: 'CM',
        transactionType: 'buy',
        paymentTypeId: _paymentMethod.id.toString(),
      );
    } catch (e) {
      setError(true);
      log.e('Unable to get payment methods');
    } finally {
      setBusy(false);
    }
  }

  void onSelectPaymentSetting(PaymentSettingModel paymentSetting) {
    _selectedPaymentSetting = paymentSetting;
    // notifyListeners();
  }

  void setError(bool value) {
    _hasError = value;
    // notifyListeners();
  }

  void onClose() {
    _navigationService.back();
  }

  void disposeViewModel() {
    _selectedPaymentSetting = null;
    _paymentSettings = [];
  }

  void setBusy(bool value) {
    _isBusy = value;
    // notifyListeners();
  }

  void onAddAnotherMethod() async {
    _navigationService.navigateTo(
      Routes.newPaymentSettingView,
      preventDuplicates: false,
      arguments: NewPaymentSettingViewArguments(paymentMethod: _paymentMethod),
    );
  }
}
