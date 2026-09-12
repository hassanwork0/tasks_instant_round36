import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../contants.dart';
import 'custom_text.dart';

class CustomTextFormField extends StatelessWidget {
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final TextEditingController textEditingController;
  final String label;
  final String hint;
  final bool? isIcon;
  final bool isPasswordVisible;
  final VoidCallback? onVisibilityPressed;
  final FormFieldValidator<String>? validator;

  const CustomTextFormField({
    super.key,
    required this.textInputType,
    required this.textInputAction,
    required this.textEditingController,
    required this.label,
    required this.hint,
    this.isIcon = false,
    this.isPasswordVisible = false,
    this.onVisibilityPressed,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: lightGreyColor.withOpacity(0.3),
          borderRadius: BorderRadius.circular(borderRadius15),
        ),
        child: TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          obscureText: isIcon! ? !isPasswordVisible : isPasswordVisible,
          keyboardType: textInputType,
          textInputAction: textInputAction,
          controller: textEditingController,
          validator: validator,
          decoration: InputDecoration(
            label: CustomText(
              title: label,
              color: blackColor,
              fontSize: fontSize18,
              fontWeight: fontWeightBold,
            ),
            hint: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: CustomText(
                title: hint,
                color: greyColor,
                fontSize: fontSize16,
              ),
            ),

            suffixIcon: isIcon!
                ? IconButton(
                    onPressed: onVisibilityPressed,
                    icon: Icon(
                      size: iconSize18,
                      isPasswordVisible
                          ? CupertinoIcons.eye
                          : CupertinoIcons.eye_slash,
                    ),
                  )
                : SizedBox(),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 12,
            ),
          ),
        ),
      ),
    );
  }
}
