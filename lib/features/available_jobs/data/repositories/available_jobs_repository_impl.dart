import 'package:dartz/dartz.dart';

import 'package:seekmax/core/errors/error_handler.dart';
import 'package:seekmax/core/errors/failures.dart';
import 'package:seekmax/features/available_jobs/data/datasources/available_jobs_remote_data_souce.dart';
import 'package:seekmax/features/available_jobs/domain/entities/job.dart';
import 'package:seekmax/features/available_jobs/domain/repositories/available_jobs_repository.dart';

class AvailableJobsRepositoryImpl extends AvailableJobsRepository with CustomErrorHandler {
  final AvailableJobsRemoteDataSource remoteDataSource;
  AvailableJobsRepositoryImpl({
    required this.remoteDataSource,
  });
  @override
  Future<Either<Failure, List<Job>>> fetchAvailableJobs({required int page}) async {
    try {
      final loginResponse = await remoteDataSource.fetchAvailableJobs(
        page: page,
      );
      return right(loginResponse.jobs.jobs);
    } catch (e) {
      if (e is Exception) {
        return Left(mapCommonExceptionToFailure(e));
      }

      return Left(UnhandledFailure(message: e.toString()));
    }
  }
}
