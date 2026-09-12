import 'package:flutter_bloc/flutter_bloc.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitialState());

  bool isPasswordVisible = false;

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    emit(PasswordVisibilityChangedState(isPasswordVisible: isPasswordVisible));
  }

  Future<void> signup({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(SignupLoadingState());
    await Future.delayed(Duration(microseconds: 1500));
    if (name == "Ola Mohamed" &&
        email == "ola@gmail.com" &&
        password == "Ol123456#") {
      emit(SignupSuccessState());
    } else {
      emit(SignupFailureState());
    }
  }
}
