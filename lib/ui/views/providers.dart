import 'package:ejara_test/ui/bottom_sheets/wallets/wallets_sheet_model.dart';
import 'package:ejara_test/ui/views/home/home_viewmodel.dart';
import 'package:ejara_test/ui/views/login/login_viewmodel.dart';
import 'package:ejara_test/ui/views/new_payment_setting/new_payment_setting_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> get providers => [
      ChangeNotifierProvider(
        lazy: false,
        create: (context) => HomeViewModel(),
      ),
      ChangeNotifierProvider(
        lazy: false,
        create: (context) => LoginViewModel(),
      ),
      ChangeNotifierProvider(
        lazy: false,
        create: (context) => WalletsSheetModel(),
      ),
      ChangeNotifierProvider(
        lazy: false,
        create: (context) => NewPaymentSettingViewModel(),
      )
    ];
