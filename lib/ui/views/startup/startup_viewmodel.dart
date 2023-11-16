import 'package:flutter/cupertino.dart';
import 'package:ejara_test/app/app.locator.dart';
import 'package:ejara_test/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends ChangeNotifier {
  final _navigationService = locator<NavigationService>();

  StartupViewModel() {
    runStartupLogic();
  }

  // Place anything here that needs to happen before we get into the application
  Future runStartupLogic() async {
    await Future.delayed(const Duration(seconds: 1));
    // This is where you can make decisions on where your app should navigate when
    // you have custom startup logic

    _navigationService.replaceWithHomeView();
  }
}
