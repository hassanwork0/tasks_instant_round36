import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:food_app/core/contants.dart';
import 'package:food_app/core/images.dart';
import 'package:food_app/core/widgets/custom_text.dart';
import 'package:food_app/features/login/presentation/cubit/login_cubit.dart';
import 'package:go_router/go_router.dart';
import 'package:toastification/toastification.dart';
import '../../../../core/routing/routes.dart';
import '../widgets/another_way_login.dart';
import '../widgets/btn_login.dart';
import '../widgets/dont_have_create_one.dart';
import '../widgets/textfield_email_password_and_forget.dart';
import '../../../../core/widgets/header_of_screen.dart';
import '../../../../core/widgets/lines_and_or.dart';
import '../../../../core/widgets/terms_policy.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) async {
        if (state is LoginLoadingState) {
          return await EasyLoading.show(
            status: 'Loading...',
            duration: Duration(milliseconds: 1500),
          );
        } else if (state is LoginSuccessState) {
          context.go(Routes.home);
        } else if (state is LoginFailureState) {
          toastification.show(
            context: context,
            title: CustomText(
              title: "Invalid Email or Password",
              color: blackColor,
              fontSize: fontSize15,
            ),
            type: ToastificationType.error,
            style: ToastificationStyle.minimal,
            autoCloseDuration: Duration(seconds: 6),
          );
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                //text welcome back, icon waving hand, text sign in to
                HeaderOfScreen(
                  title: "Welcome back",
                  imageIcon: Images.wavingHandIcon,
                  heightImage: 30,
                  widthImage: 30,
                  height: 0.8,
                  subTitle: "Sign in to continue your chat journey.",
                ),

                SizedBox(height: 50),

                //TextFormField email, TextFormField password, forget password
                TextFieldEmailPasswordAndForget(
                  formKey: formKey,
                  emailEditingController: emailController,
                  passwordEditingController: passwordController,
                ),

                SizedBox(height: 25),

                //btn login
                GestureDetector(
                  onTap: () {
                    login();
                  },
                  child: BtnLogin(),
                ),

                SizedBox(height: 25),

                //text don't have an account, text create one
                GestureDetector(
                  onTap: () {
                    context.push(Routes.signup);
                  },
                  child: DontHaveCreateOne(),
                ),

                SizedBox(height: 35),

                //left line, text or, right line
                LinesAndOr(),

                SizedBox(height: 30),

                //icon google, icon ios, icon phone
                AnotherWayLogin(),

                SizedBox(height: 120),

                //text terms of use, vertical line, text privacy policy
                TermsPolicy(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void login() {
    final bool validate = formKey.currentState?.validate() ?? false;

    if (!validate) {
      return;
    }

    final String email = emailController.text.trim().replaceAll(" ", "");
    final String password = passwordController.text;

    context.read<LoginCubit>().login(email: email, password: password);
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
}
