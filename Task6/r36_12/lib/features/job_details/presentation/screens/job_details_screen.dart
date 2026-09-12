import 'package:flutter/material.dart';
import '../../../job/data/models/jobs_model.dart';
import '../widgets/description_html.dart';
import '../widgets/job_card.dart';
import '../widgets/job_details_app_bar.dart';

class JobDetailsScreen extends StatelessWidget {
  final Data data;

  const JobDetailsScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: JobDetailsAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
        child: SingleChildScrollView(
          child: Column(
            children: [
              //job card
              JobCard(data: data),

              SizedBox(height: 10),

              //description
              DescriptionHtml(data: data),
            ],
          ),
        ),
      ),
    );
  }
}
