import 'package:ejara_test/api/user/user_apis.dart';
import 'package:ejara_test/services/user_service.dart';
import 'package:ejara_test/ui/views/home/home_view.dart';
import 'package:ejara_test/ui/views/login/login_view.dart';
import 'package:ejara_test/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:ejara_test/services/payment_service.dart';

import '../api/payment/payment_apis.dart';
import 'package:ejara_test/ui/bottom_sheets/wallets/wallets_sheet.dart';
import 'package:ejara_test/ui/views/new_payment_setting/new_payment_setting_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StarupView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: NewPaymentSettingView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
// @stacked-service

    LazySingleton(classType: UserService),
    LazySingleton(classType: UserApis),
    LazySingleton(classType: PaymentApis),
    LazySingleton(classType: PaymentService),
  ],
  bottomsheets: [
    StackedBottomsheet(classType: WalletsSheet),
// @stacked-bottom-sheet
  ],
  logger: StackedLogger(),
)
class App {}
