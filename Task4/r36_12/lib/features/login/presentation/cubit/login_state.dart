part of 'login_cubit.dart';

sealed class LoginState {}

final class LoginInitialState extends LoginState {}

final class LoginLoadingState extends LoginState {}

final class LoginSuccessState extends LoginState {}

final class LoginFailureState extends LoginState {}

final class PasswordVisibilityChangedState extends LoginState {
  final bool isPasswordVisible;

  PasswordVisibilityChangedState({required this.isPasswordVisible});
}
