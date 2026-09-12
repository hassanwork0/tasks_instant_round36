part of 'signup_cubit.dart';


sealed class SignupState {}

final class SignupInitialState extends SignupState {}

final class SignupLoadingState extends SignupState {}

final class SignupSuccessState extends SignupState {}

final class SignupFailureState extends SignupState {}

final class PasswordVisibilityChangedState extends SignupState {
  final bool isPasswordVisible;

  PasswordVisibilityChangedState({required this.isPasswordVisible});
}
