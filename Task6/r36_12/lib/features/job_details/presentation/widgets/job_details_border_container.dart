import 'package:flutter/material.dart';
import '../../../../core/contants.dart';
import '../../../../core/widgets/custom_text.dart';

class JobDetailsBorderContainer extends StatelessWidget {
  final String text;
  final bool isRemote;
  const JobDetailsBorderContainer({
    super.key,
    required this.text,
    this.isRemote = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: isRemote ? lightBlueColor : tagContainerColor,
        borderRadius: BorderRadius.circular(borderRadius20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isRemote
                ? Icons.work_outline_outlined
                : Icons.construction_outlined,
            color: isRemote ? whiteColor : appBarIconColor,
            size: iconSize18,
          ),

          SizedBox(width: 5),
          CustomText(
            title: text,
            color: isRemote ? whiteColor : appBarIconColor,
            fontSize: fontSize13,
            fontWeight: fontWeightBold,
          ),
        ],
      ),
    );
  }
}
