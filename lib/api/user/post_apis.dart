import 'package:ejara_test/api/common/api_client.dart';
import 'package:ejara_test/api/common/api_consts.dart';
import 'package:ejara_test/app/app.logger.dart';
import 'package:ejara_test/data_model/user/user_model.dart';

String loginUrl = baseUrlV1 + '/auth/login';

mixin PostApis {
  final log = getLogger('UserPostApis');
  ApiClient get apiClient => ApiClient();

  Future<UserModel> login({
    required String userName,
    required String password,
  }) async {
    return await apiClient.post<UserModel>(loginUrl, {
      "log": userName,
      "password": password,
    });
  }
}
