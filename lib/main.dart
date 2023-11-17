import 'package:ejara_test/app/app.bottomsheets.dart';
import 'package:ejara_test/ui/bottom_sheets/wallets/wallets_sheet_model.dart';
import 'package:ejara_test/ui/views/home/home_viewmodel.dart';
import 'package:ejara_test/ui/views/login/login_viewmodel.dart';
import 'package:ejara_test/ui/views/new_payment_setting/new_payment_setting_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:ejara_test/app/app.locator.dart';
import 'package:ejara_test/app/app.router.dart';
import 'package:ejara_test/ui/common/app_colors.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:stacked_services/stacked_services.dart';

Future<void> main() async {
  setupLocator();
  setupBottomSheetUi();
  await dotenv.load();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
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
      ],
      child: MaterialApp(
        theme: Theme.of(context).copyWith(
          scaffoldBackgroundColor: kcBackgroundColor,
          primaryColor: kcBackgroundColor,
          focusColor: kcPrimaryColor,
          textTheme: Theme.of(context).textTheme.apply(
                fontFamily: 'Montserrat',
                bodyColor: Colors.black,
              ),
        ),
        initialRoute: Routes.loginView,
        onGenerateRoute: StackedRouter().onGenerateRoute,
        navigatorKey: StackedService.navigatorKey,
        navigatorObservers: [
          StackedService.routeObserver,
        ],
      ),
    );
  }
}
