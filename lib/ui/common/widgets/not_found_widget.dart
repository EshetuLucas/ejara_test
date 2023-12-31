import 'package:ejara_test/ui/common/app_colors.dart';
import 'package:ejara_test/ui/common/app_text_styles.dart';
import 'package:ejara_test/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';

class NotFoundWidget extends StatelessWidget {
  const NotFoundWidget({
    super.key,
    this.title = 'Unable to load this page\nPlease try again!',
    this.onTap,
  });
  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Center(
        child: Padding(
          padding: appSymmetricHorizontalPadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              verticalSpaceSmall,
              Text(
                title,
                style: ktsMedium.copyWith(color: kcPrimaryColor),
                textAlign: TextAlign.center,
              ),
              if (onTap != null) ...[
                verticalSpaceTiny,
                Text(
                  'Tap to try again',
                  style: ktsMedium.copyWith(color: kcPrimaryColor),
                  textAlign: TextAlign.center,
                ),
                verticalSpaceSmall,
                const Icon(
                  Icons.refresh_outlined,
                  color: kcPrimaryColor,
                  size: 30,
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}
