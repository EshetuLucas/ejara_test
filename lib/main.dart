import 'package:ejara_test/app/app.bottomsheets.dart';
import 'package:ejara_test/app/locator.dart';
import 'package:ejara_test/ui/views/providers.dart';
import 'package:flutter/material.dart';
import 'package:ejara_test/app/app.router.dart';
import 'package:ejara_test/ui/common/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:stacked_services/stacked_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupAppLocator();
  setupBottomSheetUi();
  await dotenv.load();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: providers,
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
