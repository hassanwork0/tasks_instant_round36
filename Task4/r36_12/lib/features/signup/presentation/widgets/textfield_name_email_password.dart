import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../cubit/signup_cubit.dart';

class TextFieldNameEmailPassword extends StatelessWidget {
  final TextEditingController nameEditingController;
  final TextEditingController emailEditingController;
  final TextEditingController passwordEditingController;
  final nameRegex = RegExp(r'^[a-zA-Z\s]+$');
  final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  final passwordRegex = RegExp(r'[!@#$%^&*(),.?":{}|<>_\-\\/\[\]+=]');
  final GlobalKey formKey;

  TextFieldNameEmailPassword({
    super.key,
    required this.nameEditingController,
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
          //TextFormField name
          CustomTextFormField(
            textInputType: TextInputType.name,
            textInputAction: TextInputAction.next,
            textEditingController: TextEditingController(),
            label: 'Full Name',
            hint: 'Enter Name',
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Please enter your name';
              }

              if (value.trim().length < 2) {
                return 'Name must be at least 2 characters';
              }

              if (!nameRegex.hasMatch(value.trim())) {
                return 'Name can only contain letters';
              }

              return null;
            },

          ),

          SizedBox(height: 15),

          //TextFormField email
          CustomTextFormField(
            textInputType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            textEditingController: TextEditingController(),
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
          BlocBuilder<SignupCubit, SignupState>(
            builder: (context, state) {
              final myCubit = context.read<SignupCubit>();
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
        ],
      ),
    );
  }
}
