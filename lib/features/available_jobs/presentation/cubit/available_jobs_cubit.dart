import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seekmax/features/available_jobs/domain/entities/job.dart';

import 'package:seekmax/features/available_jobs/domain/usecases/fetch_available_jobs.dart';

part 'available_jobs_state.dart';

class AvailableJobsCubit extends Cubit<AvailableJobsState> {
  final FetchAvailableJobs availableJobs;
  AvailableJobsCubit({
    required this.availableJobs,
  }) : super(AvailableJobsInitial());
  void fetchAvailableJobs() async {
    emit(AvailableJobsLoadingState());
    final result = await availableJobs();
    result.fold(
      (l) => emit(AvailableJobsErrorState(
        message: l.message,
      )),
      (r) => {
        emit(AvailableJobsSuccessState(jobs: r)),
      },
    );
  }
}
