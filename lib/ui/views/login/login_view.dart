import 'package:ejara_test/ui/common/app_colors.dart';
import 'package:ejara_test/ui/common/app_text_styles.dart';
import 'package:ejara_test/ui/common/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:ejara_test/ui/common/ui_helpers.dart';
import 'package:provider/provider.dart';

import 'login_viewmodel.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    final viewModel = Provider.of<LoginViewModel>(context, listen: true);
    return Scaffold(
      body: Padding(
        padding: appSymmetricHorizontalPadding,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              horizontalSpaceSmall,
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      viewModel.errorText,
                      style: ktsMedium.copyWith(color: kcRed),
                    ),
                    verticalSpaceSmall,
                    AppButton(
                      busy: viewModel.isBusy,
                      title: 'Login',
                      onTap: viewModel.login,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
