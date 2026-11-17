import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_ui/features/job/data/model/job_model.dart';
import 'package:job_ui/features/job/presentation/bloc/job_cubit.dart';
import 'package:job_ui/features/job/presentation/bloc/job_state.dart';
import 'package:job_ui/features/job/presentation/widgets/job_card.dart';
import 'package:job_ui/features/job/presentation/widgets/job_shimmer.dart';
import 'package:material_ui/material_ui.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Latest Jobs", style: TextStyle(fontSize: 24)),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              spacing: 15,
              children: [
                Icon(Icons.search),
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 47, 33, 182) ,
                    borderRadius: BorderRadius.circular(100)
                  ),
                  child: Icon(Icons.person, color: Colors.white)),
              ],
            ),
          ),
        ],
      ),
      body: BlocBuilder<JobCubit, JobState>(
        builder: (context, state) {
          switch (state) {
            case JobInitialState():
              return Center(child: CircularProgressIndicator());

            case JobLoadingState():
              return JobsShimmer();

            case JobLoadedState():
              final jobs = state.jobs;
              return loadedJob(jobs: jobs);

            case JobFailureState(:final errorMessage):
              return JobFailure(errorMessage: errorMessage);
          }
        },
      ),
    );
  }
}

class loadedJob extends StatelessWidget {
  const new({
    super.key,
    required this.jobs,
  });

  final List<JobModel> jobs;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  if(jobs.isNotEmpty)
                  Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 69, 54, 209),
                      borderRadius: BorderRadius.circular(100)
                    ),
                  ),
                  Text(" ${jobs.length} job openings"),
                ],
              ),
              Text("Europe & Remote"),
            ],
          ),
        ),
        Expanded(
          child: jobs.isEmpty
              ? emptyJob()
              : ListView.builder(
                  itemCount: jobs.length,
                  itemBuilder: (context, index) {
                    final job = jobs[index];
                    return jobCard(
                      key: ValueKey(job.slug),
                      jobModel: job,
                    );
                  },
                ),
        ),
      ],
    );
  }
}

class emptyJob extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 229, 233, 252),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Icon(
                Icons.search_off,
                size: 100,
                color: Color.fromARGB(255, 88, 95, 108),
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            "No jobs found",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Text(
            "No jobs found at the moment.",
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              context.read<JobCubit>().getJobs();
            },
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: Color.fromARGB(255, 47, 33, 182),
              fixedSize: Size(300, 70),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.replay_rounded , color: Colors.white,),
                Text("Reset active filters", style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class JobFailure extends StatelessWidget {
  const JobFailure({super.key, required this.errorMessage});

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 229, 233, 252),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Icon(
                Icons.error,
                size: 100,
                color: Color.fromARGB(255, 88, 95, 108),
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            errorMessage,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Text(
            "Failed to load jobs. Please check your internet connection or try again shortly.",
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              context.read<JobCubit>().getJobs();
            },
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: Color.fromARGB(255, 47, 33, 182),
              fixedSize: Size(300, 70),
            ),
            child: Text("Retry", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
