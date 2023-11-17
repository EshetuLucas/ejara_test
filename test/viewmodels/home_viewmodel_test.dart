import 'package:ejara_test/app/app.bottomsheets.dart';
import 'package:ejara_test/data_model/payment_method/payment_method.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ejara_test/app/app.locator.dart';
import 'package:ejara_test/ui/views/home/home_viewmodel.dart';
import 'package:mockito/mockito.dart';

import '../helpers/test_helpers.dart';

void main() {
  HomeViewModel _getModel() => HomeViewModel();

  group('HomeViewmodelTest -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());

    group(
      'setError -',
      () {
        test('When called with false, should set error value to [false]', () {
          final viewModel = _getModel();
          viewModel.setError(false);
          expect(viewModel.hasError, false);
        });
        test('When called with true, should set error value to [true]', () {
          final viewModel = _getModel();
          viewModel.setError(true);
          expect(viewModel.hasError, true);
        });
      },
    );

    group(
      'setBusy -',
      () {
        test('When called with false, should set busy value to [false]', () {
          final viewModel = _getModel();
          viewModel.setBusy(false);
          expect(viewModel.isBusy, false);
        });
        test('When called with true, should set busy value to [true]', () {
          final viewModel = _getModel();
          viewModel.setBusy(true);
          expect(viewModel.isBusy, true);
        });
      },
    );

    group(
      'getPaymentMethods -',
      () {
        test(
            'When called with country code and transactionType, should make get payment method request ',
            () {
          final _paymentService = getAndRegisterPaymentService();

          final viewModel = _getModel();
          viewModel.getPaymentMethods();
          verify(
            _paymentService.getPaymentMethods(
                countryCode: "CM", transactionType: "buy"),
          );
        });

        test(
            'When called with country code and transactionType and fail, should set error value true',
            () {
          getAndRegisterPaymentService(success: false);
          final viewModel = _getModel();
          viewModel.getPaymentMethods();
          expect(viewModel.hasError, true);
        });
        test(
            'When called with country code and transactionType and success, should set error value false',
            () {
          final viewModel = _getModel();
          viewModel.getPaymentMethods();
          expect(viewModel.hasError, false);
        });
      },
    );

    group('showBottomSheet -', () {
      test('When called, should show custom bottom sheet using wallet variant',
          () async {
        final bottomSheetService = getAndRegisterBottomSheetService();
        final viewModel = _getModel();
        PaymentMethodModel paymentMethod = fakePaymentMethods.first;
        viewModel.showBottomSheet(paymentMethod);
        verify(
          bottomSheetService.showCustomSheet(
            variant: BottomSheetType.wallets,
            title: paymentMethod.title_en.toLowerCase(),
            data: paymentMethod,
          ),
        );
      });
    });
  });
}
