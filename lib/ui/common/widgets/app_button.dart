import 'package:ejara_test/ui/common/app_colors.dart';
import 'package:ejara_test/ui/common/app_text_styles.dart';
import 'package:ejara_test/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String title;
  final String? subTitle;
  final Function onTap;
  final bool enabled;
  final Color backgroundColor;
  final Color? textColor;
  final Color? loadingColor;
  final double height;
  final bool busy;
  final bool isOutlined;
  final bool shadow;
  final TextStyle? enablebuttonTextStyle;
  final TextStyle? disablebuttonTextStyle;
  final bool showButton;
  final Widget? leadingWidget;
  final bool roundOnlyBottom;
  final double borderRadius;
  final double fontSize;

  const AppButton(
      {Key? key,
      this.fontSize = 15,
      this.loadingColor,
      this.borderRadius = 16,
      required this.title,
      this.roundOnlyBottom = false,
      this.enabled = true,
      this.busy = false,
      this.isOutlined = false,
      this.backgroundColor = kcPrimaryColor,
      this.textColor,
      this.shadow = false,
      this.height = 50,
      this.enablebuttonTextStyle,
      this.disablebuttonTextStyle,
      required this.onTap,
      this.showButton = true,
      this.subTitle,
      this.leadingWidget})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final enableTextStyle =
        enablebuttonTextStyle ?? ktsSmallBold.copyWith(fontSize: 14);
    return GestureDetector(
      onTap: () => enabled && !busy ? onTap() : null,
      child: AnimatedContainer(
        curve: Curves.easeIn,
        duration: const Duration(milliseconds: 300),
        alignment: Alignment.center,
        height: height,
        width: double.infinity,
        decoration: BoxDecoration(
          color: enabled || busy
              ? backgroundColor
              : kcDarkGreyColor.withOpacity(0.1),
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius),
          ),
        ),
        child: AnimatedCrossFade(
          duration: const Duration(milliseconds: 150),
          crossFadeState:
              busy ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          firstChild: SizedBox(
              width: height - 15,
              height: height - 15,
              child: FittedBox(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CircularProgressIndicator(
                    color: loadingColor ?? kcWhite,
                    strokeWidth: 6,
                  ),
                ),
              )),
          secondChild: Padding(
            padding: const EdgeInsets.all(5.0),
            child: FittedBox(
                child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                leadingWidget ?? const SizedBox.shrink(),
                if (leadingWidget != null) horizontalSpaceSmall,
                Text(
                  title,
                  style: enabled
                      ? enableTextStyle.copyWith(
                          color: textColor ?? kcWhite,
                          fontSize: fontSize,
                        )
                      : enableTextStyle.copyWith(
                          color: kcDarkGreyColor.withOpacity(0.5),
                          fontSize: fontSize),
                  textAlign: TextAlign.center,
                ),
                if (subTitle != null)
                  const SizedBox(
                    height: 3,
                  ),
                if (subTitle != null)
                  Text(
                    subTitle!,
                    style: enabled
                        ? enableTextStyle.copyWith(
                            color: textColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 18)
                        : disablebuttonTextStyle == null
                            ? ktsMedium.copyWith(
                                color: textColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 18)
                            : disablebuttonTextStyle!.copyWith(
                                color: textColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
              ],
            )),
          ),
        ),
      ),
    );
  }
}
