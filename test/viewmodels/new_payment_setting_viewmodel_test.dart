import 'package:ejara_test/ui/views/new_payment_setting/new_payment_setting_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ejara_test/app/app.locator.dart';
import 'package:mockito/mockito.dart';

import '../helpers/test_helpers.dart';

void main() {
  NewPaymentSettingViewModel _getModel() => NewPaymentSettingViewModel();
  group('NewPaymentSettingViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());

    group(
      'onClose -',
      () {
        test('When called , should close the view', () {
          final _navigationService = getAndRegisterNavigationService();
          final viewModel = _getModel();
          viewModel.onClose();
          verify(_navigationService.back());
        });
      },
    );
  });
}
