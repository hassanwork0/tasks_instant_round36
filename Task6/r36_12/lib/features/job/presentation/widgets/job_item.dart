import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/contants.dart';
import '../../data/models/jobs_model.dart';
import '../cubit/job_cubit.dart';
import 'btn_apply.dart';
import 'header_of_card.dart';
import 'location_tags_job_types.dart';

class JobItem extends StatelessWidget {
  final Data data;
  const JobItem({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Container(
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(borderRadius15),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            //icon ,job title, company name, save icon
            HeaderOfCard(data: data),

            SizedBox(height: 10),

            //location, tags, job types
            LocationTagsJobTypes(data: data),

            SizedBox(height: 15),

            //btn apply
            BtnApply(
              onTap: () {
                context.read<JobCubit>().openJobUrl(data.url);
              },
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
