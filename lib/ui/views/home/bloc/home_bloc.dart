import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:ejara_test/app/locator.dart';
import 'package:ejara_test/data_model/payment_method/payment_method.dart';
import 'package:ejara_test/services/payment_service.dart';
import 'package:flutter/material.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final _paymentService = appLocator<PaymentService>();
  HomeBloc() : super(InitialState()) {
    on<PaymentMethodsLoaded>(getPaymentMethods);
  }

  FutureOr<void> paymentMethodsLoaded(
      PaymentMethodsLoaded event, Emitter<HomeState> emit) {}

  FutureOr<void> getPaymentMethods(
      PaymentMethodsLoaded event, Emitter<HomeState> emit) async {
    emit(PaymentMethodLoading());
    try {
      final paymentMethods = await _paymentService.getPaymentMethods(
        countryCode: 'CM',
        transactionType: 'buy',
      );
      emit(PaymentMethodSuccess(paymentMethods: paymentMethods));
    } catch (e) {
      emit(PaymentMethodFailure(
          errorMessage: 'Unable to fetch payment methods '));
    }
  }
}
