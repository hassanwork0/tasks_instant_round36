import 'package:flutter/material.dart';
import '../../data/models/jobs_model.dart';
import 'border_container.dart';

class LocationTagsJobTypes extends StatelessWidget {
  final Data data;
  const LocationTagsJobTypes({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Wrap(
        alignment: WrapAlignment.start,
        runSpacing: 10,
        spacing: 8,
        children: [
          //location
          BorderContainer(text: data.location, isLocation: true),
          //remote
          BorderContainer(text: data.isRemoteString),
          //tags
          ...data.tags!.map((tag) => BorderContainer(text: tag)),
          //job types
          ...data.jobTypes!.map((jobType) => BorderContainer(text: jobType)),
        ],
      ),
    );
  }
}
