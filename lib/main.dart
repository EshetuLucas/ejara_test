import 'package:ejara_test/app/app.bottomsheets.dart';
import 'package:ejara_test/ui/views/home/home_viewmodel.dart';
import 'package:ejara_test/ui/views/startup/startup_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:ejara_test/app/app.locator.dart';
import 'package:ejara_test/app/app.router.dart';
import 'package:ejara_test/ui/common/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:stacked_services/stacked_services.dart';

void main() {
  setupLocator();
  setupBottomSheetUi();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => StartupViewModel(),
        )
      ],
      child: MaterialApp(
        theme: Theme.of(context).copyWith(
          scaffoldBackgroundColor: kcBackgroundColor,
          primaryColor: kcBackgroundColor,
          focusColor: kcPrimaryColor,
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: Colors.black,
              ),
        ),
        initialRoute: Routes.startupView,
        onGenerateRoute: StackedRouter().onGenerateRoute,
        navigatorKey: StackedService.navigatorKey,
        navigatorObservers: [
          StackedService.routeObserver,
        ],
      ),
    );
  }
}
