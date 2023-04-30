part of 'available_jobs_cubit.dart';

abstract class AvailableJobsState {
  const AvailableJobsState();
}

class AvailableJobsInitial extends AvailableJobsState {}

class AvailableJobsLoadingState extends AvailableJobsState {}

class AvailableJobsErrorState extends AvailableJobsState {
  final String message;
  const AvailableJobsErrorState({
    required this.message,
  });
}

class AvailableJobsSuccessState extends AvailableJobsState {
  final List<Job> jobs;
  const AvailableJobsSuccessState({
    required this.jobs,
  });
}
