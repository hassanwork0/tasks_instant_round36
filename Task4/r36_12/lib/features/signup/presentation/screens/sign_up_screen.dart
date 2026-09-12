import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/images.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/widgets/header_of_screen.dart';
import '../../../../core/widgets/lines_and_or.dart';
import '../../../../core/widgets/terms_policy.dart';
import '../cubit/signup_cubit.dart';
import '../widgets/another_way_signup.dart';
import '../widgets/btn_signup.dart';
import '../widgets/have_one_login.dart';
import '../widgets/textfield_name_email_password.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //text create you account, icon waving hand, text sign in to
              HeaderOfScreen(
                title: "Create your account",
                imageIcon: Images.rocketIcon,
                heightImage: 50,
                widthImage: 35,
                height: 0.05,
                subTitle: "It only takes a minute to get started.",
              ),

              SizedBox(height: 50),

              //TextFormField name, TextFormField email, TextFormField password,
              TextFieldNameEmailPassword(
                formKey: formKey,
                nameEditingController: nameController,
                emailEditingController: emailController,
                passwordEditingController: passwordController,
              ),

              SizedBox(height: 25),

              //btn signup
              GestureDetector(
                  onTap: (){
                    signup();
                  },
                  child: BtnSignup()),

              SizedBox(height: 25),

              //text have account, text sign in
              GestureDetector(
                onTap: () {
                  context.push(Routes.login);
                },
                child: HaveOneLogin(),
              ),

              SizedBox(height: 35),

              //left line, text or, right line
              LinesAndOr(),

              SizedBox(height: 30),

              //icon google, icon ios, icon phone
              AnotherWaySignup(),

              SizedBox(height: 60,),

              //text terms of use, vertical line, text privacy policy
              TermsPolicy(),


            ],
          ),
        ),
      ),
    );
  }

  void signup() {
    final bool validate = formKey.currentState?.validate() ?? false;

    if (!validate) {
      return;
    }

    final String name = nameController.text.trim();
    final String email = emailController.text.trim().replaceAll(" ", "");
    final String password = passwordController.text;

    context.read<SignupCubit>().signup(
      name: name,
      email: email,
      password: password,
    );
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
}
