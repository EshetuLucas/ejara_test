import 'package:ejara_test/app/app.logger.dart';
import 'package:ejara_test/app/locator.dart';
import 'package:ejara_test/services/user_service.dart';

import 'package:ejara_test/app/app.router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends Cubit {
  final log = getLogger('StartupViewModel');
  final _navigationService = appLocator<NavigationService>();
  final _userService = appLocator<UserService>();

  String _errorText = '';

  LoginViewModel(super.initialState);
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
    // notifyListeners();
  }

  void setBusy(bool value) {
    _isBusy = value;
    //notifyListeners();
  }

  void setError(bool value) {
    _hasError = value;
    //notifyListeners();
  }

  int size = 30;

  List<int> elements = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  double map(int index) {
    elements.sort(
      (a, b) => a.compareTo(b),
    );
    return size / elements.length - 1;
  }
}
