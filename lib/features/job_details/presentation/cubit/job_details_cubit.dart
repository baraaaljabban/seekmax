import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seekmax/features/job_details/domain/entities/job_details.dart';
import 'package:seekmax/features/job_details/domain/usecases/apply_job.dart';

import 'package:seekmax/features/job_details/domain/usecases/fetch_job_details.dart';

part 'job_details_state.dart';

class JobDetailsCubit extends Cubit<JobDetailsState> {
  final FetchJobDetails fetchJobDetails;
  final ApplyForJob applyForJob;
  var jobId = '';
  JobDetailsCubit({
    required this.fetchJobDetails,
    required this.applyForJob,
  }) : super(JobDetailsInitial());

  void onFetchJobDetails({required String jobId}) async {
    this.jobId = jobId;
    emit(JobDetailsLoadingState());
    final result = await fetchJobDetails(params: jobId);
    result.fold(
      (l) => emit(JobDetailsFailedState(
        message: l.message,
      )),
      (r) => {
        emit(JobDetailsSuccessfulState(jobDetails: r)),
      },
    );
  }

  void onApplyForJob() async {
    final result = await applyForJob(params: jobId);
    result.fold(
      (l) => emit(JobDetailsFailedState(
        message: l.message,
      )),
      (r) => {
        emit(ApplyResultState(
          applied: r,
          jobId: jobId,
        )),
      },
    );
  }
}
