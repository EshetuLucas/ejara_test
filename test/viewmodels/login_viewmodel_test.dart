import 'package:ejara_test/app/app.router.dart';
import 'package:ejara_test/ui/views/login/login_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ejara_test/app/app.locator.dart';
import 'package:mockito/mockito.dart';

import '../helpers/test_helpers.dart';

void main() {
  LoginViewModel _getModel() => LoginViewModel();
  group('LoginViewModel Tests -', () {
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
      'setErrorText -',
      () {
        test(
            'When called with error text, should set error text value to a given error text ',
            () {
          final viewModel = _getModel();
          String errorText = 'Error Text';
          viewModel.setErrorText(errorText);
          expect(viewModel.errorText, errorText);
        });
      },
    );

    group(
      'login -',
      () {
        test('When called, should should make login request ', () {
          final userService = getAndRegisterUserService();
          final viewModel = _getModel();
          viewModel.login();
          verify(
            userService.login(
              userName: 'ejaraTests',
              password: 'CmKVGexi%REJjn!u65BI7PlR5',
            ),
          );
        });

        test('When called and success, should navigate to home view', () async {
          final navigationService = getAndRegisterNavigationService();
          final userService = getAndRegisterUserService();
          final viewModel = _getModel();
          await viewModel.login();
          verifyInOrder([
            await userService.login(
              userName: 'ejaraTests',
              password: 'CmKVGexi%REJjn!u65BI7PlR5',
            ),
            await navigationService.replaceWithHomeView(),
          ]);
        });

        test('When called and fail, should set error value to true ', () async {
          getAndRegisterUserService(success: false);
          final viewModel = _getModel();
          viewModel.login();
          expect(viewModel.hasError, true);
        });

        test(
            'When called with error text, should set error text value to "Unable to Login. Try again!" ',
            () async {
          getAndRegisterUserService(success: false);
          final viewModel = _getModel();
          await viewModel.login();

          expect(viewModel.errorText, "Unable to Login. Try again!");
        });
      },
    );
  });
}
