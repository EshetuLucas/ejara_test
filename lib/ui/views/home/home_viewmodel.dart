import 'package:ejara_test/app/app.bottomsheets.dart';
import 'package:ejara_test/app/app.logger.dart';
import 'package:ejara_test/app/locator.dart';
import 'package:ejara_test/data_model/payment_method/payment_method.dart';
import 'package:ejara_test/services/payment_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends Cubit {
  final log = getLogger('HomeViewModel');
  final _bottomSheetService = appLocator<BottomSheetService>();

  final _paymentService = appLocator<PaymentService>();

  bool _hasError = false;

  HomeViewModel(super.initialState);
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
    //notifyListeners();
  }

  void setBusy(bool value) {
    _isBusy = value;
    // notifyListeners();
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

  Future<void> showBottomSheet(PaymentMethodModel paymentMethod) async {
    final result = await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.wallets,
      title: paymentMethod.title_en.toLowerCase(),
      data: paymentMethod,
    );

    if (result?.data == null) return;

    // Use the returned data here
  }
}
