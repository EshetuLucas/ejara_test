part of 'home_bloc.dart';

@immutable
class HomeState {}

final class InitialState extends HomeState {}

final class PaymentMethodLoading extends HomeState {}

final class PaymentMethodSuccess extends HomeState {
  final List<PaymentMethodModel> paymentMethods;

  PaymentMethodSuccess({required this.paymentMethods});
}

final class PaymentMethodFailure extends HomeState {
  final String errorMessage;

  PaymentMethodFailure({required this.errorMessage});
}
