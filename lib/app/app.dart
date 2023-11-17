import 'package:ejara_test/api/user/user_apis.dart';
import 'package:ejara_test/services/user_service.dart';
import 'package:ejara_test/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:ejara_test/ui/views/home/home_view.dart';
import 'package:ejara_test/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    // @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    // @stacked-service

    LazySingleton(classType: UserService),
    LazySingleton(classType: UserApis),
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  logger: StackedLogger(),
)
class App {}
