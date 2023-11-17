import 'package:ejara_test/ui/common/app_colors.dart';
import 'package:ejara_test/ui/common/app_text_styles.dart';
import 'package:ejara_test/ui/common/ui_helpers.dart';
import 'package:ejara_test/ui/common/widgets/app_button.dart';
import 'package:ejara_test/ui/common/widgets/app_switch.dart';
import 'package:ejara_test/ui/common/widgets/icon_builder.dart';
import 'package:ejara_test/ui/common/widgets/input_field.dart';
import 'package:ejara_test/ui/views/new_payment_setting/new_payment_setting_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewPaymentSettingView extends StatelessWidget {
  const NewPaymentSettingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel =
        Provider.of<NewPaymentSettingViewModel>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: appSymmetricHorizontalPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: viewModel.onClose,
                child: const IconBuilder(
                  iconData: Icons.close,
                ),
              ),
              verticalSpace(20),
              Center(
                child: Text(
                  'New Mobile money',
                  style:
                      ktsLargBold.copyWith(color: kcPrimaryColor, fontSize: 26),
                  textAlign: TextAlign.center,
                ),
              ),
              verticalSpace(40),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const _Variant(
                        title: 'Choose the mobile operator',
                        widget: _OperatorWidget(),
                      ),
                      verticalSpaceMedium,
                      const _Variant(
                        title: 'Phone number',
                        widget: InputField(
                          placeholder: 'Enter phone number',
                          hasFocusedBorder: true,
                        ),
                      ),
                      verticalSpaceMedium,
                      const _Variant(
                        title: 'Full name',
                        widget: InputField(
                          placeholder: 'Enter full name',
                          hasFocusedBorder: true,
                        ),
                      ),
                      verticalSpaceMedium,
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 2),
                            child: AppSwitch(
                              onToggle: viewModel.onChange,
                              state: true,
                            ),
                          ),
                          horizontalSpaceSmall,
                          const Text(
                            'Save as payment method',
                            style: ktsMedium,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              AppButton(title: 'Continue', onTap: viewModel.onContinue),
              verticalSpaceSmall,
            ],
          ),
        ),
      ),
    );
  }
}

class _Variant extends StatelessWidget {
  const _Variant({
    required this.title,
    required this.widget,
  });

  final String title;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: ktsMedium.copyWith(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        verticalSpaceTiny,
        widget,
      ],
    );
  }
}

class _OperatorWidget extends StatelessWidget {
  const _OperatorWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 2),
      height: 50,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: kcWhite,
        border: Border.all(color: kcDarkGreyColor.withOpacity(0.13)),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      child: Row(
        children: [
          Text(
            'Choose the mobile operator',
            style: ktsMedium.copyWith(
              fontSize: 14,
              color: kcPrimaryColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          const Icon(
            Icons.expand_more,
            size: 17,
          )
        ],
      ),
    );
  }
}
