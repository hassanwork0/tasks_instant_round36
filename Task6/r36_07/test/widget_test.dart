import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:task6/features/jobs/data/models/job_model.dart';
import 'package:task6/features/jobs/data/repository/job_repository.dart';
import 'package:task6/features/jobs/presentation/cubit/jobs_cubit.dart';
import 'package:task6/features/jobs/presentation/screens/jobs_screen.dart';

class FakeJobRepository implements JobRepository {
  FakeJobRepository(this.handler);

  final Future<List<Job>> Function() handler;

  @override
  Future<List<Job>> getJobs() => handler();
}

void main() {
  group('Job model', () {
    test('fromJson parses the arbeitnow job fields', () {
      final json = {
        'slug': 'flutter-developer-berlin-123',
        'company_name': 'Google',
        'title': 'Flutter Developer',
        'location': 'Berlin',
        'url': 'https://arbeitnow.com/job',
        'created_at': 1786225219,
        'job_types': ['Full Time'],
      };

      final job = Job.fromJson(json);

      expect(job.id, 'flutter-developer-berlin-123');
      expect(job.companyName, 'Google');
      expect(job.title, 'Flutter Developer');
      expect(job.location, 'Berlin');
      expect(job.url, 'https://arbeitnow.com/job');
      expect(job.jobType, 'Full Time');
      expect(job.createdAt.isAfter(DateTime(2020)), isTrue);
    });

    test('fromJson handles missing optional fields', () {
      final job = Job.fromJson({
        'slug': 'job-1',
        'title': 'Engineer',
        'company_name': 'ACME',
        'location': '',
        'url': '',
        'created_at': null,
      });

      expect(job.id, 'job-1');
      expect(job.jobType, isNull);
      expect(job.relativeTime, contains('ago'));
    });
  });

  group('JobsCubit', () {
    test('emits loaded state with jobs when list is populated', () async {
      final cubit = JobsCubit(
        repository: FakeJobRepository(() async => [
              Job(
                id: '1',
                title: 'Engineer',
                companyName: 'ACME',
                location: 'Berlin',
                url: 'https://example.com',
                createdAt: DateTime.now(),
              ),
            ]),
      );

      final states = <JobsState>[];
      final subscription = cubit.stream.listen(states.add);

      await cubit.loadJobs();
      await Future<void>.delayed(Duration.zero);

      expect(states[0], isA<JobsLoadingState>());
      expect(states[1], isA<JobsLoadedState>());
      expect((states[1] as JobsLoadedState).jobs, hasLength(1));

      await subscription.cancel();
      cubit.close();
    });

    test('emits failure state when repository throws', () async {
      final cubit = JobsCubit(
        repository: FakeJobRepository(() async => throw Exception('boom')),
      );

      final states = <JobsState>[];
      final subscription = cubit.stream.listen(states.add);

      await cubit.loadJobs();
      await Future<void>.delayed(Duration.zero);

      expect(states[1], isA<JobsFailureState>());
      expect(
        (states[1] as JobsFailureState).errorMessage,
        'Failed to load jobs. Check your internet connection.',
      );

      await subscription.cancel();
      cubit.close();
    });
  });

  group('JobsScreen', () {
    Widget wrap(JobsCubit cubit) {
      return MaterialApp(
        home: BlocProvider.value(
          value: cubit,
          child: const JobsScreen(),
        ),
      );
    }

    testWidgets('shows empty state when no jobs are returned', (tester) async {
      final cubit = JobsCubit(
        repository: FakeJobRepository(() async => []),
      );

      await tester.pumpWidget(wrap(cubit));
      await tester.pumpAndSettle();

      expect(find.text('No jobs found at the moment.'), findsOneWidget);

      await cubit.close();
    });

    testWidgets('shows error state and retries on failure', (tester) async {
      var calls = 0;
      final cubit = JobsCubit(
        repository: FakeJobRepository(() async {
          calls++;
          if (calls == 1) {
            throw Exception('network down');
          }
          return [
            Job(
              id: '1',
              title: 'Flutter Engineer',
              companyName: 'ACME',
              location: 'Berlin',
              url: 'https://example.com',
              createdAt: DateTime.now(),
            ),
          ];
        }),
      );

      await tester.pumpWidget(wrap(cubit));
      await tester.pumpAndSettle();

      expect(find.text('Oops! Something went wrong.'), findsOneWidget);

      await tester.tap(find.text('Retry'));
      await tester.pumpAndSettle();

      expect(find.text('Flutter Engineer'), findsOneWidget);

      await cubit.close();
    });
  });
}
