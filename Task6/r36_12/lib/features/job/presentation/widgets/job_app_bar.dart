import 'package:flutter/material.dart';
import '../../../../core/contants.dart';
import '../../../../core/widgets/custom_text.dart';

class JobAppBar extends StatelessWidget implements PreferredSizeWidget {
  final int jobsNum;
  const JobAppBar({super.key, required this.jobsNum});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Column(
        spacing: 2,
        children: [
          //CareerLink
          CustomText(
            title: 'CareerLink',
            color: darkBlueColor,
            fontSize: fontSize20,
            fontWeight: fontWeightBold,
          ),
          //Found 42 Jobs
          CustomText(
            title: 'Found $jobsNum Jobs',
            color: greyAppBarColor,
            fontSize: fontSize14,
          ),
        ],
      ),
      centerTitle: true,
      elevation: 1,
      shadowColor: greyColor,
      leading: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.search_rounded,
            color: darkBlueColor,
            size: iconSize25,
          ),
        ),
      ),
      actionsPadding: EdgeInsets.only(right: 10),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.tune_outlined,
            color: greyAppBarColor,
            size: iconSize25,
          ),
        ),
      ],
    );
  }
}
