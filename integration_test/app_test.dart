import 'package:ejara_test/app/app.locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ejara_test/main.dart' as app;
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end to end test', () {
    testWidgets(
      'Navigate to login page',
      (tester) async {
        await locator.reset();
        app.main();
        final loginFinder = find.byKey(const Key('login'));
        final homeFinder = find.byKey(const Key('homeView'));

        await tester.pumpAndSettle();
        await tester.tap(loginFinder);
        await tester.pumpUntilFound(homeFinder);

        await delay();
        expect(homeFinder, findsOneWidget);
      },
    );

    testWidgets(
      'Open bottom sheet',
      (tester) async {
        await locator.reset();
        app.main();
        final loginFinder = find.byKey(const Key('login'));
        final homeFinder = find.byKey(const Key('homeView'));
        final walletSheetFinder = find.byKey(const Key('WalletsSheet'));

        await tester.pumpAndSettle();
        await tester.tap(loginFinder);

        await tester.pumpUntilFound(homeFinder);
        await delay();

        await tester.tap(find.byType(InkWell).first);
        await tester.pumpUntilFound(walletSheetFinder);

        await delay();
        expect(walletSheetFinder, findsOneWidget);
      },
    );

    testWidgets(
      'Close bottom sheet',
      (tester) async {
        await locator.reset();
        app.main();
        final loginFinder = find.byKey(const Key('login'));
        final homeFinder = find.byKey(const Key('homeView'));
        final walletSheetFinder = find.byKey(const Key('WalletsSheet'));

        final closeBottomSheetFinder =
            find.byKey(const Key('closeBottomSheet'));
        await tester.pumpAndSettle();
        await tester.tap(loginFinder);

        await tester.pumpUntilFound(homeFinder);
        await delay();

        await tester.tap(find.byType(InkWell).first);
        await tester.pumpUntilFound(walletSheetFinder);

        await delay();

        await tester.tap(closeBottomSheetFinder);
        await tester.pumpUntilFound(homeFinder);

        expect(homeFinder, findsOneWidget);
      },
    );

    testWidgets(
      'Navigate to new payment setting view',
      (tester) async {
        await locator.reset();
        app.main();
        final loginFinder = find.byKey(const Key('login'));
        final homeFinder = find.byKey(const Key('homeView'));
        final walletSheetFinder = find.byKey(const Key('WalletsSheet'));
        final newPaymentSettingFinder =
            find.byKey(const Key('newPaymentSetting'));
        final anotherPaymentMethodButtonFinder =
            find.byKey(const Key('anotherPaymentMethodButton'));

        await tester.pumpAndSettle();
        await tester.tap(loginFinder);

        await tester.pumpUntilFound(homeFinder);
        await tester.tap(find.byType(InkWell).first);

        await tester.pumpUntilFound(walletSheetFinder);
        await delay();

        await tester.tap(anotherPaymentMethodButtonFinder);
        await tester.pumpUntilFound(newPaymentSettingFinder);

        expect(newPaymentSettingFinder, findsOneWidget);
      },
    );

    testWidgets(
      'Navigate back to bottom sheet',
      (tester) async {
        await locator.reset();
        app.main();
        final loginFinder = find.byKey(const Key('login'));
        final homeFinder = find.byKey(const Key('homeView'));
        final walletSheetFinder = find.byKey(const Key('WalletsSheet'));
        final newPaymentSettingFinder =
            find.byKey(const Key('newPaymentSetting'));
        final anotherPaymentMethodButtonFinder =
            find.byKey(const Key('anotherPaymentMethodButton'));
        final closeNewPaymentSettingViewFinder = find.byKey(const Key('close'));

        await tester.pumpAndSettle();
        await tester.tap(loginFinder);

        await tester.pumpUntilFound(homeFinder);
        await tester.tap(find.byType(InkWell).first);

        await tester.pumpUntilFound(walletSheetFinder);
        await delay();

        await tester.tap(anotherPaymentMethodButtonFinder);
        await tester.pumpUntilFound(newPaymentSettingFinder);

        await tester.tap(closeNewPaymentSettingViewFinder);
        await tester.pumpUntilFound(walletSheetFinder);

        expect(walletSheetFinder, findsOneWidget);
      },
    );
  });
}

/// PumpAndSettle doesn't work with animations, so manuel dealy is used

extension PumpUntilFound on WidgetTester {
  Future<void> pumpUntilFound(
    Finder finder, {
    Duration duration = const Duration(seconds: 1),
    int tries = 5,
  }) async {
    for (var i = 0; i < tries; i++) {
      await pump(duration);

      final result = finder.precache();

      if (result) {
        finder.evaluate();
        break;
      }
    }
  }
}

Future<void> delay({int seconds = 4}) async {
  await Future.delayed(Duration(seconds: seconds));
}
