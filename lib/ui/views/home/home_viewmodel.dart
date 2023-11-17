import 'package:ejara_test/app/app.bottomsheets.dart';
import 'package:ejara_test/app/app.locator.dart';
import 'package:ejara_test/services/user_service.dart';
import 'package:ejara_test/ui/common/app_strings.dart';
import 'package:flutter/widgets.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends ChangeNotifier {
  final _bottomSheetService = locator<BottomSheetService>();
  final _userService = locator<UserService>();

  String get counterLabel => 'Counter is: $_counter';

  int _counter = 0;

  Future<void> onInit() async {
    await _userService.login(
      userName: 'ejaraTests',
      password: 'CmKVGexi%REJjn!u65BI7PlR5',
    );
  }

  void incrementCounter() {
    _counter++;
    notifyListeners();
  }

  void showBottomSheet() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.notice,
      title: ksHomeBottomSheetTitle,
      description: ksHomeBottomSheetDescription,
    );
  }
}
