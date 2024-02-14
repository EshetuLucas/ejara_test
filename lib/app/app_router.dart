import 'package:ejara_test/data_model/payment_method/payment_method.dart';
import 'package:ejara_test/ui/views/home/home_view.dart';
import 'package:ejara_test/ui/views/login/login_view.dart';
import 'package:ejara_test/ui/views/new_payment_setting/new_payment_setting_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRoute = GoRouter(routes: [
  GoRoute(
    path: '/login',
    builder: (BuildContext context, GoRouterState state) {
      return LoginView();
    },
  ),
  GoRoute(
    path: '/home',
    builder: (BuildContext context, GoRouterState state) {
      return const HomeView();
    },
  ),
  // GoRoute(
  //   path: '/payment_setting/:paymentMethod',
  //   builder: (BuildContext context, GoRouterState state) {
  //     return NewPaymentSettingView(
  //       paymentMethod: state.pathParameters['paymentMethod']!,
  //     );
  //   },
  // ),
]);

class NewPaymentSettingViewArguments {
  const NewPaymentSettingViewArguments({
    required this.paymentMethod,
  });

  final PaymentMethodModel paymentMethod;
}
