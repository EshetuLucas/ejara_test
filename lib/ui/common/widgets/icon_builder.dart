import 'package:ejara_test/ui/common/app_colors.dart';
import 'package:flutter/material.dart';

class IconBuilder extends StatelessWidget {
  const IconBuilder({
    super.key,
    required this.iconData,
  });
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: kcSecondaryColor.withOpacity(0.15),
      ),
      child: Icon(
        iconData,
        color: kcSecondaryColor,
        size: 20,
      ),
    );
  }
}
