import 'package:ejara_test/api/common/api_client.dart';
import 'package:ejara_test/api/common/api_consts.dart';
import 'package:ejara_test/app/app.logger.dart';
import 'package:ejara_test/data_model/user/user_model.dart';

String getUserUrl = baseUrlV1 + '/accounts/auth/login';

mixin GetApis {
  final log = getLogger('UserGetApis');
  ApiClient get apiClient => ApiClient();

  Future<UserModel> login({
    required String userName,
    required String password,
  }) async {
    return await apiClient.get<UserModel>(
      getUserUrl,
    );
  }
}
