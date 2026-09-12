import 'package:flutter/material.dart';
import '../../../../core/contants.dart';
import '../../../../core/widgets/custom_text.dart';

class BtnApply extends StatelessWidget {
  VoidCallback onTap;
  BtnApply({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: Align(
          alignment: AlignmentGeometry.bottomRight,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            decoration: BoxDecoration(
              color: darkBlueColor,
              borderRadius: BorderRadius.circular(borderRadius10),
            ),
            child: CustomText(
              title: "Apply",
              color: whiteColor,
              fontSize: fontSize20,
            ),
          ),
        ),
      ),
    );
  }
}
