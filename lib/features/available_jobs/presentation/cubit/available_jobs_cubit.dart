import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seekmax/features/available_jobs/domain/entities/job.dart';

import 'package:seekmax/features/available_jobs/domain/usecases/fetch_available_jobs.dart';

part 'available_jobs_state.dart';

class AvailableJobsCubit extends Cubit<AvailableJobsState> {
  final FetchAvailableJobs availableJobs;
  var page = 1;
  List<Job> jobs = [];

  AvailableJobsCubit({
    required this.availableJobs,
  }) : super(AvailableJobsInitial());
  void fetchAvailableJobs() async {
    emit(AvailableJobsLoadingState());
    final result = await availableJobs(params: page);
    result.fold(
      (l) => emit(AvailableJobsErrorState(
        message: l.message,
      )),
      (r) => {
        page++,
        jobs.addAll(r),
        emit(AvailableJobsSuccessState(jobs: jobs)),
      },
    );
  }

  /// Fetches the next page of popular Jobs and emits a success or error state, depending on the outcome of the request. If the request is successful, the new movies are added to the existing list of movies.
  void loadMoreJobsList() async {
    final result = await availableJobs(params: page);
    result.fold(
      (l) {
        emit(AvailableJobsErrorState(message: l.message));
      },
      (r) {
        page++;

        final updatedMovies = List<Job>.from(jobs)..addAll(r);
        if (updatedMovies.length > jobs.length) {
          jobs = updatedMovies;
          emit(AvailableJobsSuccessState(jobs: jobs));
        }
      },
    );
  }
}
