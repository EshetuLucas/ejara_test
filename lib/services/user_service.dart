import 'package:ejara_test/api/user/user_apis.dart';
import 'package:ejara_test/app/app.locator.dart';
import 'package:ejara_test/app/app.logger.dart';

import '../data_model/user/user_model.dart';

class UserService {
  final log = getLogger('UserService');
  final _userApis = locator<UserApis>();

  bool get hasUser => _currentUser != null;

  UserModel? _currentUser;
  UserModel get currentUser => _currentUser!;

  Future<void> login({
    required String userName,
    required String password,
  }) async {
    final result =
        await _userApis.login(userName: userName, password: password);
    setCurrentUser(result);
  }

  Future<void> setCurrentUser(UserModel user) async {
    log.i('user:$user');
    _currentUser = user;
  }
}
