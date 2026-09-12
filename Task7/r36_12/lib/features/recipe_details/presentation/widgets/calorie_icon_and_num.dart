import 'package:flutter/material.dart';
import '../../../../core/colors/colors_app.dart';
import '../../../../core/constants/fonts.dart';
import '../../../../core/constants/icon_size.dart';
import '../../../../core/constants/radius_size.dart';
import '../../../../core/widgets/custom_worksans_text.dart';

class CalorieIconAndNum extends StatelessWidget {
  final String calorieNum;
  const CalorieIconAndNum({super.key, required this.calorieNum});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //icon calorie
        SizedBox(
          width: IconSize.iconSize25,
          height: IconSize.iconSize25,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: ColorsApp.darkGreyColor, width: 2),
              borderRadius: BorderRadius.circular(RadiusSize.borderRadius5),
            ),
            child: Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 2),
                child: CircleAvatar(
                  radius: 4,
                  backgroundColor: ColorsApp.darkGreyColor,
                  child: Icon(
                    Icons.more_horiz,
                    color: ColorsApp.whiteColor,
                    size: 6,
                  ),
                ),
              ),
            ),
          ),
        ),

        SizedBox(width: 5),

        //num calorie
        CustomWorkSansText(
          title: calorieNum,
          color: ColorsApp.darkGreyColor,
          fontSize: Fonts.fontSize18,
        ),
      ],
    );
  }
}
