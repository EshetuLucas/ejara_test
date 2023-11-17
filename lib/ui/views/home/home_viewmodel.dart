import 'package:ejara_test/app/app.bottomsheets.dart';
import 'package:ejara_test/app/app.locator.dart';
import 'package:ejara_test/app/app.logger.dart';
import 'package:ejara_test/data_model/payment_method/payment_method.dart';
import 'package:ejara_test/services/payment_service.dart';
import 'package:flutter/widgets.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends ChangeNotifier {
  final log = getLogger('HomeViewModel');
  final _bottomSheetService = locator<BottomSheetService>();

  final _paymentService = locator<PaymentService>();

  bool _hasError = false;
  bool get hasError => _hasError;

  bool _isBusy = false;
  bool get isBusy => _isBusy;

  List<PaymentMethodModel> _paymentMethods = [];
  List<PaymentMethodModel> get paymentMethods =>
      isBusy ? fakePaymentMethods : _paymentMethods;

  Future<void> onInit() async {
    await getPaymentMethods();
  }

  void setError(bool value) {
    _hasError = value;
    notifyListeners();
  }

  void setBusy(bool value) {
    _isBusy = value;
    notifyListeners();
  }

  Future<void> getPaymentMethods() async {
    setError(false);
    setBusy(true);
    try {
      /// Using const countryCode and transactionType for testing purposes
      _paymentMethods = await _paymentService.getPaymentMethods(
        countryCode: 'CM',
        transactionType: 'buy',
      );
    } catch (e) {
      setError(true);
      log.e('Unable to get payment methods');
    } finally {
      setBusy(false);
    }
  }

  Future<void> showBottomSheet(int paymentMethodindex) async {
    PaymentMethodModel paymentMethod = _paymentMethods[paymentMethodindex];

    final result = await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.wallets,
      title: paymentMethod.title_en.toLowerCase(),
      description: paymentMethod.id.toString(),
      data: paymentMethod,
    );

    if (result?.data == null) return;

    // Use the returned data here
  }
}
