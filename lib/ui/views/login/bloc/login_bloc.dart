import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ejara_test/app/app.router.dart';
import 'package:ejara_test/app/locator.dart';
import 'package:ejara_test/extensions/string_extensions.dart';
import 'package:ejara_test/services/user_service.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:email_validator/email_validator.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final _userService = appLocator<UserService>();
  final _navigationService = appLocator<NavigationService>();

  LoginBloc() : super(LoginInitialState()) {
    on<LoginInitialEvent>(loginInitialEvent);
    on<LoginButtonClickedEvent>(loginButtonClickedEvent);
  }

  FutureOr<void> loginButtonClickedEvent(
      LoginButtonClickedEvent event, Emitter<LoginState> emit) async {
    final email = event.email;
    final password = event.password;
    String emailValidationError = validateEmail(email);
    String passwordValidationError = validatePassword(password);

    emit(LoginErrorState(''));
    if (emailValidationError.isNotEmpty) {
      return emit(LoginErrorState(emailValidationError));
    }
    if (passwordValidationError.isNotEmpty) {
      return emit(LoginErrorState(passwordValidationError));
    }

    emit(LoginLoadingState());

    try {
      await _userService.login(
        userName: 'ejaraTests',
        password: 'CmKVGexi%REJjn!u65BI7PlR5',
      );
      _navigationService.navigateTo(Routes.homeView);
    } catch (e) {
      emit(LoginLoadedState());
      emit(LoginErrorState('Unable to Login. Try again!'));
    }
  }

  bool isEmailValid(String? email) =>
      EmailValidator.validate((email ?? '').trim());

  String validatePassword(String? password,
      {bool isSignup = false,
      isChangePassword = false,
      String? confirmPassword}) {
    if (password.isNullOrEmpty || password!.length < 6) {
      return 'Password should be at least 6 characters';
    } else if ((isSignup || isChangePassword) && password != confirmPassword) {
      return 'Please make sure your passwords match';
    }
    return '';
  }

  String validateEmail(String? email) {
    if (email.isNullOrEmpty) {
      return 'Email can\'t be empty';
    }
    if (!isEmailValid(email)) {
      return 'Please enter a valid email address';
    }
    return '';
  }

  FutureOr<void> loginInitialEvent(
      LoginInitialEvent event, Emitter<LoginState> emit) {
    emit(LoginLoadingState());
  }
}
