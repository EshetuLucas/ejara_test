import 'package:ejara_test/api/payment/payment_apis.dart';
import 'package:ejara_test/api/user/user_apis.dart';
import 'package:ejara_test/services/payment_service.dart';
import 'package:ejara_test/services/user_service.dart';
import 'package:get_it/get_it.dart';
import 'package:stacked_services/stacked_services.dart';

final appLocator = GetIt.instance;

void setupAppLocator() {
  // Register dependencies
  appLocator.registerLazySingleton(() => BottomSheetService());
  appLocator.registerLazySingleton(() => DialogService());
  appLocator.registerLazySingleton(() => NavigationService());
  appLocator.registerLazySingleton(() => UserService());
  appLocator.registerLazySingleton(() => UserApis());
  appLocator.registerLazySingleton(() => PaymentApis());
  appLocator.registerLazySingleton(() => PaymentService());
}
