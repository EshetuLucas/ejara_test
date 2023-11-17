import 'package:ejara_test/app/app.logger.dart';
import 'package:ejara_test/services/user_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:ejara_test/app/app.locator.dart';
import 'package:ejara_test/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends ChangeNotifier {
  final log = getLogger('StartupViewModel');
  final _navigationService = locator<NavigationService>();
  final _userService = locator<UserService>();

  String _errorText = '';
  String get errorText => _errorText;

  bool _isBusy = false;
  bool get isBusy => _isBusy;

  bool _hasError = false;
  bool get hasError => _hasError;

  Future<void> login() async {
    setError(false);
    setErrorText('');
    setBusy(true);
    try {
      await _userService.login(
        userName: 'ejaraTests',
        password: 'CmKVGexi%REJjn!u65BI7PlR5',
      );
      _navigationService.replaceWithHomeView();
    } catch (e) {
      setError(true);
      setErrorText('Unable to Login. Try again!');
      log.e('Unable to login in: $e');
    } finally {
      setBusy(false);
    }
  }

  void setErrorText(String value) {
    _errorText = value;
    notifyListeners();
  }

  void setBusy(bool value) {
    _isBusy = value;
    notifyListeners();
  }

  void setError(bool value) {
    _hasError = value;
    notifyListeners();
  }
}
