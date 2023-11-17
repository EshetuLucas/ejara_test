import 'package:ejara_test/data_model/payment_method/payment_method.dart';
import 'package:ejara_test/data_model/payment_setting/payment_setting.dart';
import 'package:ejara_test/exceptions/api_exceptions.dart';
import 'package:ejara_test/services/user_service.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ejara_test/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:ejara_test/services/payment_service.dart';
// @stacked-import

import 'test_helpers.mocks.dart';

@GenerateMocks([], customMocks: [
  MockSpec<NavigationService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<BottomSheetService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<DialogService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<PaymentService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<UserService>(onMissingStub: OnMissingStub.returnDefault),
// @stacked-mock-spec
])
void registerServices() {
  getAndRegisterNavigationService();
  getAndRegisterBottomSheetService();
  getAndRegisterDialogService();
  getAndRegisterPaymentService();
  getAndRegisterUserService();
// @stacked-mock-register
}

MockUserService getAndRegisterUserService({
  String userName = 'ejaraTests',
  String password = 'CmKVGexi%REJjn!u65BI7PlR5',
  bool success = true,
}) {
  _removeRegistrationIfExists<UserService>();
  final service = MockUserService();
  locator.registerSingleton<UserService>(service);
  when(service.login(userName: userName, password: password))
      .thenAnswer((realInvocation) {
    if (!success) throw ApiException(message: 'Unable to login');
    return Future(() => null);
  });
  return service;
}

MockNavigationService getAndRegisterNavigationService() {
  _removeRegistrationIfExists<NavigationService>();
  final service = MockNavigationService();
  locator.registerSingleton<NavigationService>(service);
  return service;
}

MockBottomSheetService getAndRegisterBottomSheetService<T>({
  SheetResponse<T>? showCustomSheetResponse,
}) {
  _removeRegistrationIfExists<BottomSheetService>();
  final service = MockBottomSheetService();

  when(service.showCustomSheet<T, T>(
    enableDrag: anyNamed('enableDrag'),
    enterBottomSheetDuration: anyNamed('enterBottomSheetDuration'),
    exitBottomSheetDuration: anyNamed('exitBottomSheetDuration'),
    ignoreSafeArea: anyNamed('ignoreSafeArea'),
    isScrollControlled: anyNamed('isScrollControlled'),
    barrierDismissible: anyNamed('barrierDismissible'),
    additionalButtonTitle: anyNamed('additionalButtonTitle'),
    variant: anyNamed('variant'),
    title: anyNamed('title'),
    hasImage: anyNamed('hasImage'),
    imageUrl: anyNamed('imageUrl'),
    showIconInMainButton: anyNamed('showIconInMainButton'),
    mainButtonTitle: anyNamed('mainButtonTitle'),
    showIconInSecondaryButton: anyNamed('showIconInSecondaryButton'),
    secondaryButtonTitle: anyNamed('secondaryButtonTitle'),
    showIconInAdditionalButton: anyNamed('showIconInAdditionalButton'),
    takesInput: anyNamed('takesInput'),
    barrierColor: anyNamed('barrierColor'),
    barrierLabel: anyNamed('barrierLabel'),
    customData: anyNamed('customData'),
    data: anyNamed('data'),
    description: anyNamed('description'),
  )).thenAnswer((realInvocation) =>
      Future.value(showCustomSheetResponse ?? SheetResponse<T>()));

  locator.registerSingleton<BottomSheetService>(service);
  return service;
}

MockDialogService getAndRegisterDialogService() {
  _removeRegistrationIfExists<DialogService>();
  final service = MockDialogService();
  locator.registerSingleton<DialogService>(service);
  return service;
}

MockPaymentService getAndRegisterPaymentService({
  String countryCode = "CM",
  String transactionType = 'buy',
  String paymentTypeId = '1',
  bool success = true,
}) {
  _removeRegistrationIfExists<PaymentService>();
  final service = MockPaymentService();
  locator.registerSingleton<PaymentService>(service);

  when(service.getPaymentSettingsByType(
    paymentTypeId: paymentTypeId,
    countryCode: countryCode,
    transactionType: transactionType,
  )).thenAnswer((realInvocation) {
    if (!success) {
      throw ApiException(message: 'Unable to get payment settings');
    }
    return Future(() => fakePaymentSettings);
  });
  when(service.getPaymentMethods(
    countryCode: countryCode,
    transactionType: transactionType,
  )).thenAnswer((realInvocation) {
    if (!success) {
      throw ApiException(message: 'Unable to get payment methods');
    }
    return Future(() => fakePaymentMethods);
  });
  return service;
}
// @stacked-mock-create

void _removeRegistrationIfExists<T extends Object>() {
  if (locator.isRegistered<T>()) {
    locator.unregister<T>();
  }
}
