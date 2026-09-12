import 'package:flutter/material.dart';
import 'package:job_app/features/job_details/presentation/widgets/remote_tags_job_types.dart';
import '../../../../core/contants.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../../job/data/models/jobs_model.dart';
import 'icon_clock_text_days_ago.dart';
import 'location_icon_and_text.dart';

class JobCard extends StatelessWidget {
  final Data data;
  const JobCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(borderRadius10),
        border: Border.all(color: borderColor, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //icon
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius10),
              border: Border.all(color: borderColor, width: 1),
              color: backGroundIconColor,
            ),
            child: Icon(
              Icons.engineering_outlined,
              size: iconSize30,
              color: darkBlueColor,
            ),
          ),

          SizedBox(height: 20),

          //company name
          CustomText(
            title: data.companyName,
            color: darkBlueColor,
            fontSize: fontSize18,
            fontWeight: fontWeightBold,
          ),

          SizedBox(height: 3),

          //job title
          CustomText(
            title: data.title,
            color: appBarIconColor,
            fontSize: fontSize20,
            fontWeight: fontWeightBold,
          ),

          SizedBox(height: 15),

          //icon location, text location
          LocationIconAndText(data: data),

          SizedBox(height: 15),

          //icon clock, text 2 days ago
          IconClockTextDaysAgo(data: data),

          SizedBox(height: 15),

          //remote, tags, job types
          RemoteTagsJobTypes(data: data),
        ],
      ),
    );
  }
}
