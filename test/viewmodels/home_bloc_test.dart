import 'package:ejara_test/app/app.bottomsheets.dart';
import 'package:ejara_test/data_model/payment_method/payment_method.dart';
import 'package:ejara_test/ui/views/home/bloc/home_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ejara_test/app/app.locator.dart';
import 'package:ejara_test/ui/views/home/home_viewmodel.dart';
import 'package:mockito/mockito.dart';

import '../helpers/test_helpers.dart';

void main() {
  HomeBloc _homeBloc() => HomeBloc();

  group('HomeViewmodelTest -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());

    group(
      'setError -',
      () {
        test('When called with false, should set error value to [false]', () {
          final homeBloc = _homeBloc();
          homeBloc.add(PaymentMethodsLoaded());
          expect(homeBloc.hasError, false);
        });
        test('When called with true, should set error value to [true]', () {
          final homeBloc = _homeBloc();
          homeBloc.setError(true);
          expect(homeBloc.hasError, true);
        });
      },
    );

    group(
      'setBusy -',
      () {
        test('When called with false, should set busy value to [false]', () {
          final homeBloc = _homeBloc();
          homeBloc.setBusy(false);
          expect(homeBloc.isBusy, false);
        });
        test('When called with true, should set busy value to [true]', () {
          final homeBloc = _homeBloc();
          homeBloc.setBusy(true);
          expect(homeBloc.isBusy, true);
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

          final homeBloc = _homeBloc();
          homeBloc.getPaymentMethods();
          verify(
            _paymentService.getPaymentMethods(
                countryCode: "CM", transactionType: "buy"),
          );
        });

        test(
            'When called with country code and transactionType and fail, should set error value true',
            () {
          getAndRegisterPaymentService(success: false);
          final homeBloc = _homeBloc();
          homeBloc.getPaymentMethods();
          expect(homeBloc.hasError, true);
        });
        test(
            'When called with country code and transactionType and success, should set error value false',
            () {
          final homeBloc = _homeBloc();
          homeBloc.getPaymentMethods();
          expect(homeBloc.hasError, false);
        });
      },
    );

    group('showBottomSheet -', () {
      test('When called, should show custom bottom sheet using wallet variant',
          () async {
        final bottomSheetService = getAndRegisterBottomSheetService();
        final homeBloc = _homeBloc();
        PaymentMethodModel paymentMethod = fakePaymentMethods.first;
        homeBloc.showBottomSheet(paymentMethod);
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
