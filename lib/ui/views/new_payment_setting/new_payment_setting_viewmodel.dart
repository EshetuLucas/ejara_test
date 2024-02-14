import 'package:ejara_test/app/locator.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

class NewPaymentSettingViewModel extends ChangeNotifier {
  final _navigationService = appLocator<NavigationService>();

  void onClose() => _navigationService.back();

  void onChange(bool? value) {}
  void onContinue() {}
}
