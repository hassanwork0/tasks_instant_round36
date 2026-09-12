import 'package:flutter/material.dart';
import '../../../job/data/models/jobs_model.dart';
import 'job_details_border_container.dart';

class RemoteTagsJobTypes extends StatelessWidget {
  final Data data;
  const RemoteTagsJobTypes({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.start,
      runSpacing: 10,
      spacing: 8,
      children: [
        //remote
        JobDetailsBorderContainer(text: data.isRemoteString, isRemote: true),
        //tags
        ...data.tags!.map((tag) => JobDetailsBorderContainer(text: tag)),

        //job types
        ...data.jobTypes!.map(
          (jobType) => JobDetailsBorderContainer(text: jobType),
        ),
      ],
    );
  }
}
