import 'package:flutter/material.dart';
import '../../../../core/contants.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../../job/data/models/jobs_model.dart';

class LocationIconAndText extends StatelessWidget {
  final Data data;
  const LocationIconAndText({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //icon location
        Icon(
          Icons.location_on_outlined,
          size: iconSize20,
          color: greyAppBarColor,
        ),
        SizedBox(width: 5),
        //text location
        CustomText(
          title: data.location,
          color: greyAppBarColor,
          fontSize: fontSize15,
        ),
      ],
    );
  }
}
