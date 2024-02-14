import 'package:ejara_test/app/app.logger.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class StarupViewModel extends Cubit {
  StarupViewModel(super.initialState);

  final log = getLogger('StartupViewModel');

  /// Run any starup logic here
  Future<void> runStarupLogic() async {}
}
