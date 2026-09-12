import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/contants.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../cubit/login_cubit.dart';

class TextFieldEmailPasswordAndForget extends StatelessWidget {
  final TextEditingController emailEditingController;
  final TextEditingController passwordEditingController;
  final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  final passwordRegex = RegExp( r'[!@#$%^&*(),.?":{}|<>_\-\\/\[\]+=]');
  final GlobalKey formKey;

  TextFieldEmailPasswordAndForget({
    super.key,
    required this.emailEditingController,
    required this.passwordEditingController,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          //TextFormField email
          CustomTextFormField(
            textInputType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            textEditingController: emailEditingController,
            label: 'Email Address',
            hint: 'Enter Email Address',
            validator: (value) {
              if (value == null || value
                  .trim()
                  .isEmpty) {
                return 'Please enter your email';
              }

              if (!emailRegex.hasMatch(value.trim())) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),

          SizedBox(height: 15),

          //TextFormField password
          BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              final myCubit = context.read<LoginCubit>();
              return CustomTextFormField(
                textInputType: TextInputType.text,
                textInputAction: TextInputAction.done,
                textEditingController: passwordEditingController,
                label: 'Password',
                hint: 'Create Password',
                isIcon: true,
                isPasswordVisible: myCubit.isPasswordVisible,
                onVisibilityPressed: () {
                  myCubit.togglePasswordVisibility();
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }

                  if (value.length < 8) {
                    return 'Password must be at least 8 characters';
                  }

                  if (!RegExp(r'[A-Z]').hasMatch(value)) {
                    return 'Password must contain an uppercase letter';
                  }

                  if (!RegExp(r'[a-z]').hasMatch(value)) {
                    return 'Password must contain a lowercase letter';
                  }

                  if (!RegExp(r'[0-9]').hasMatch(value)) {
                    return 'Password must contain a number';
                  }
                  if (!passwordRegex.hasMatch(value.trim())) {
                    return 'Password must contain a symbol';
                  }

                  return null;
                },
              );
            },
          ),
          SizedBox(height: 10),

          //text forget password
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Align(
              alignment: Alignment.bottomRight,
              child: CustomText(
                title: "Forget Password?",
                color: greyColor,
                fontSize: fontSize16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
