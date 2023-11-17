import 'package:ejara_test/ui/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class AppSwitch extends StatelessWidget {
  const AppSwitch({
    Key? key,
    required this.onToggle,
    this.state = false,
  }) : super(key: key);

  final bool state;
  final Function(bool) onToggle;

  @override
  Widget build(BuildContext context) {
    final backgroundColor = state ? kcSecondaryColor : kcDarkGreyColor;
    return FlutterSwitch(
      activeColor: backgroundColor,
      width: 28.0,
      height: 16.0,
      toggleSize: 14,
      value: state,
      borderRadius: 100.0,
      padding: 3,
      onToggle: onToggle,
    );
  }
}
