import 'package:ejara_test/app/app.router.dart';
import 'package:ejara_test/data_model/payment_method/payment_method.dart';
import 'package:ejara_test/data_model/payment_setting/payment_setting.dart';
import 'package:ejara_test/ui/bottom_sheets/wallets/wallets_sheet_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ejara_test/app/app.locator.dart';
import 'package:mockito/mockito.dart';

import '../helpers/test_helpers.dart';

void main() {
  WalletsSheetModel _getModel() => WalletsSheetModel();
  group('WalletsSheetModel Tests -', () {
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
      'onSelectPaymentSetting -',
      () {
        test(
          'When called with payment setting, should set _selectedPaymentSetting ',
          () {
            final viewModel = _getModel();
            viewModel.onSelectPaymentSetting(fakePaymentSettings.first);
            expect(viewModel.hasSelectedPaymentSetting, true);
          },
        );
      },
    );

    group(
      'getPaymentSettingsByType -',
      () {
        test(
          'When called with paymentMethodId, country code and transactionmtype, should make get payment settings by id request ',
          () async {
            final paymentMethod = fakePaymentMethods.first;
            final _paymentService = getAndRegisterPaymentService(
                paymentTypeId: paymentMethod.id.toString());

            final viewModel = _getModel();
            viewModel.onInit(paymentMethod);
            viewModel.getPaymentSettingsByType();

            verify(_paymentService.getPaymentSettingsByType(
              paymentTypeId: paymentMethod.id.toString(),
              countryCode: 'CM',
              transactionType: 'buy',
            ));
          },
        );

        test(
          'When called with paymentMethod id, country code and transaction type and fail, should set error value to true',
          () {
            final paymentMethod = fakePaymentMethods.first;
            getAndRegisterPaymentService(
              paymentTypeId: paymentMethod.id.toString(),
              success: false,
            );
            final viewModel = _getModel();
            viewModel.onInit(paymentMethod);
            viewModel.getPaymentSettingsByType();

            expect(viewModel.hasError, true);
          },
        );

        test(
          'When called with paymentMethodId, country code and transactionType, and success, should set error value to false',
          () {
            final paymentMethod = fakePaymentMethods.first;
            final viewModel = _getModel();
            viewModel.onInit(paymentMethod);
            viewModel.getPaymentSettingsByType();
            expect(viewModel.hasError, false);
          },
        );
      },
    );
  });
  group(
    'onAddAnotherMethod -',
    () {
      test('When called , should navigate to new payment setting view', () {
        final _navigationService = getAndRegisterNavigationService();
        getAndRegisterPaymentService();
        final viewModel = _getModel();
        final paymentMethod = fakePaymentMethods.first;
        viewModel.onInit(paymentMethod);
        viewModel.onAddAnotherMethod();
        verify(_navigationService.navigateTo(Routes.newPaymentSettingView,
            preventDuplicates: false,
            arguments:
                NewPaymentSettingViewArguments(paymentMethod: paymentMethod)));
      });
    },
  );

  group(
    'onClose -',
    () {
      test('When called , should close bottom sheet', () {
        final _navigationService = getAndRegisterNavigationService();
        getAndRegisterPaymentService();
        final viewModel = _getModel();
        viewModel.onClose();
        verify(_navigationService.back());
      });
    },
  );
}
