import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:job_app/core/contants.dart';
import 'package:job_app/core/widgets/custom_text.dart';
import 'package:job_app/features/job/presentation/cubit/job_cubit.dart';
import 'package:shimmer/shimmer.dart';
import 'package:toastification/toastification.dart';
import '../../../../core/routing/routes.dart';
import '../../data/models/jobs_model.dart';
import '../widgets/job_app_bar.dart';
import '../widgets/job_item.dart';

class JobScreen extends StatelessWidget {
  const JobScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<JobCubit, JobState>(
      listener: (context, state) async {
        if (state is JobLoadingUrl) {
          EasyLoading.show(status: 'Loading...');
        } else if (state is JobLoadedUrl) {
          EasyLoading.dismiss();
        } else if (state is JobFailureUrl) {
          toastification.show(
            context: context,
            title: CustomText(
              title: "Failed to open url",
              color: blackColor,
              fontSize: fontSize15,
            ),
            type: ToastificationType.error,
            style: ToastificationStyle.minimal,
            autoCloseDuration: Duration(seconds: 10),
          );
        }
      },
      builder: (context, state) {
        if (state is JobInitialState) {
          return Scaffold(appBar: JobAppBar(jobsNum: 0), body: SizedBox());
        } else if (state is JobLoadingState) {
          return Scaffold(appBar: JobAppBar(jobsNum: 0), body: JobShimmer());
        } else if (state is JobLoadedState) {
          final jobs = state.dataList;
          return Scaffold(
            appBar: JobAppBar(jobsNum: jobs.length),
            body: jobs.isEmpty ? const JobsEmpty() : JobsList(jobList: jobs),
          );
        } else if (state is JobFailureState) {
          return const Scaffold(
            appBar: JobAppBar(jobsNum: 0),
            body: JobsFailure(),
          );
        }
        return const SizedBox();
      },
    );
  }
}

class JobShimmer extends StatelessWidget {
  const JobShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            width: double.infinity,
            height: 250,
            margin: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        );
      },
    );
  }
}

class JobsEmpty extends StatelessWidget {
  const JobsEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius10),
            color: whiteColor,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 17,
                offset: Offset(0, 6),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              //image
              Image.asset("assets/empty_img.png", fit: BoxFit.contain),

              //text No Jobs Found
              CustomText(
                title: "No jobs found",
                color: appBarIconColor,
                fontSize: fontSize25,
                fontWeight: fontWeightBold,
              ),

              SizedBox(height: 10),

              //text sub error
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomText(
                  title:
                      "Try adjusting your filters or search terms to find more opportunities.",
                  color: greyAppBarColor,
                  fontSize: fontSize16,
                  textAlign: TextAlign.center,
                ),
              ),

              SizedBox(height: 70),
            ],
          ),
        ),
      ),
    );
  }
}

class JobsList extends StatelessWidget {
  final List<Data> jobList;
  const JobsList({super.key, required this.jobList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: jobList.length,
      itemBuilder: (context, index) {
        final jobs = jobList[index];
        return GestureDetector(
          onTap: () {
            context.push(Routes.jobDetails, extra: jobs);
          },
          child: JobItem(data: jobs),
        );
      },
    );
  }
}

class JobsFailure extends StatelessWidget {
  const JobsFailure({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          //icon cloud
          Container(
            padding: EdgeInsets.all(30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius100),
              color: lightRedColor,
            ),
            child: Icon(Icons.cloud_off, size: iconSize90, color: darkRedColor),
          ),
          SizedBox(height: 20),

          //text Something went wrong
          CustomText(
            title: "Something went wrong",
            color: appBarIconColor,
            fontSize: fontSize25,
            fontWeight: fontWeightBold,
          ),

          SizedBox(height: 10),

          //text sub error
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomText(
              title:
                  "We couldn't load the jobs right now. Please check your connection and try again.",
              color: greyAppBarColor,
              fontSize: fontSize16,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
