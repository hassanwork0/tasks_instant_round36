import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());

  bool isPasswordVisible = false;

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    emit(PasswordVisibilityChangedState(isPasswordVisible: isPasswordVisible));
  }

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoadingState());
    await Future.delayed(Duration(microseconds: 1500));
    if (email == "ola@gmail.com" && password == "Ol123456#") {
      emit(LoginSuccessState());
    } else {
      emit(LoginFailureState());
    }
  }
}
