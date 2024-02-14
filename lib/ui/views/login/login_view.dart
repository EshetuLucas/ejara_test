import 'package:ejara_test/ui/common/app_colors.dart';
import 'package:ejara_test/ui/common/app_text_styles.dart';
import 'package:ejara_test/ui/common/widgets/app_button.dart';
import 'package:ejara_test/ui/common/widgets/input_field.dart';
import 'package:ejara_test/ui/views/login/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:ejara_test/ui/common/ui_helpers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(
    BuildContext context,
  ) {
    final loginBloc = context.read<LoginBloc>();
    return BlocConsumer<LoginBloc, LoginState>(
      bloc: loginBloc,
      listener: (context, state) {},
      builder: (context, state) {
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
                        InputField(
                          placeholder: 'Email',
                          controller: emailController,
                          textInputType: TextInputType.emailAddress,
                          hasInputDecoration: true,
                          hasFocusedBorder: true,
                        ),
                        verticalSpaceSmall,
                        InputField(
                          placeholder: 'Password',
                          controller: passwordController,
                          hasInputDecoration: true,
                          hasFocusedBorder: true,
                        ),
                        Text(
                          state is LoginErrorState ? state.errorText : '',
                          style: ktsMedium.copyWith(color: kcRed),
                        ),
                        verticalSpaceSmall,
                        AppButton(
                          key: const Key('login'),
                          busy: state is LoginLoadingState,
                          title: 'Login',
                          onTap: () => loginBloc.add(LoginButtonClickedEvent(
                              email: emailController.text,
                              password: passwordController.text)),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
