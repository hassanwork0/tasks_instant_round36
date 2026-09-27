import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_list_screen/features/login/presentation/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
   LoginCubit() : super(LoginInitial());

   void login(String email, String password) async {
      emit(LoginLoading());

      await Future.delayed(Duration(seconds: 1));
      if(email == 'mo@gmail.com' && password == '123456') {
         emit(LoginSuccess());
      } else {
         emit(LoginFailure('Invalid email or password.'));
      }
   }
}