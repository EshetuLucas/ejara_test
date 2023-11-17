import 'package:ejara_test/app/app.logger.dart';

import 'package:flutter/cupertino.dart';

class StarupViewModel extends ChangeNotifier {
  final log = getLogger('StartupViewModel');

  /// Run any starup logic here
  Future<void> runStarupLogic() async {}
}
