part of 'job_details_cubit.dart';

abstract class JobDetailsState {
  const JobDetailsState();
}

class JobDetailsInitial extends JobDetailsState {}

class JobDetailsLoadingState extends JobDetailsState {}

class JobDetailsSuccessfulState extends JobDetailsState {
  final JobDetails jobDetails;
  JobDetailsSuccessfulState({
    required this.jobDetails,
  });
}

class JobDetailsFailedState extends JobDetailsState {
  final String message;
  JobDetailsFailedState({
    required this.message,
  });
}
