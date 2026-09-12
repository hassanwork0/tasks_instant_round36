import 'package:flutter/material.dart';
import '../../../../core/contants.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../data/models/jobs_model.dart';

class HeaderOfCard extends StatelessWidget {
  final Data data;

  const HeaderOfCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    //icon ,job title, company name, save icon
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //icon
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius10),
              color: backGroundIconColor,
            ),
            child: Icon(
              Icons.engineering_outlined,
              size: iconSize30,
              color: darkBlueColor,
            ),
          ),
        ),
        //job title, company name
        SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //job title
              CustomText(
                title: data.title,
                color: blackColor,
                fontSize: fontSize20,
                fontWeight: fontWeightBold,
              ),
              //company name
              CustomText(
                title: data.companyName,
                color: greyAppBarColor,
                fontSize: fontSize18,
              ),
            ],
          ),
        ),

        //icon bookmark
        IconButton(
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          onPressed: () {},
          icon: Icon(
            Icons.bookmark_border_outlined,
            color: greyAppBarColor,
            size: iconSize25,
          ),
        ),
      ],
    );
  }
}
