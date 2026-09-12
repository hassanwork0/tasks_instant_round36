import 'package:flutter/material.dart';
import '../../../../core/contants.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../../job/data/models/jobs_model.dart';

class IconClockTextDaysAgo extends StatelessWidget {
  final Data data;
  const IconClockTextDaysAgo({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //icon clock
        Icon(
          Icons.access_time_outlined,
          size: iconSize18,
          color: lightBlueColor,
          fontWeight: fontWeightBold,
        ),
        SizedBox(width: 5),
        //text 2 days ago
        CustomText(
          title: data.postedAgo,
          color: lightBlueColor,
          fontSize: fontSize15,
          fontWeight: fontWeightBold,
        ),
      ],
    );
  }
}
