import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seekmax/features/job_details/domain/entities/job_details.dart';

import 'package:seekmax/features/job_details/domain/usecases/fetch_job_details.dart';

part 'job_details_state.dart';

class JobDetailsCubit extends Cubit<JobDetailsState> {
  final FetchJobDetails fetchJobDetails;
  JobDetailsCubit({
    required this.fetchJobDetails,
  }) : super(JobDetailsInitial());

  void onFetchJobDetails({required String jobId}) async {
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
}
