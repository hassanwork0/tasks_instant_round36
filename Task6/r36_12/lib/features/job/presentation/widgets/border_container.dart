import 'package:flutter/material.dart';
import '../../../../core/contants.dart';
import '../../../../core/widgets/custom_text.dart';

class BorderContainer extends StatelessWidget {
  final String text;
  final bool isLocation;
  const BorderContainer({
    super.key,
    required this.text,
    this.isLocation = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      decoration: BoxDecoration(
        color: isLocation ? locationGreyColor : tagContainerColor,
        borderRadius: BorderRadius.circular(borderRadius5),
      ),
      child: isLocation
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.location_on_outlined, size: iconSize18),
                CustomText(
                  title: text,
                  color: textDarkGreyColor,
                  fontSize: fontSize13,
                  fontWeight: fontWeightBold,
                ),
              ],
            )
          : CustomText(
              title: text,
              color: textDarkGreyColor,
              fontSize: fontSize13,
              fontWeight: fontWeightBold,
            ),
    );
  }
}
