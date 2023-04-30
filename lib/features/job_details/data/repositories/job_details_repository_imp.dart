import 'package:dartz/dartz.dart';
import 'package:seekmax/core/errors/error_handler.dart';

import 'package:seekmax/core/errors/failures.dart';
import 'package:seekmax/features/job_details/data/datasources/job_details_remote_data_source.dart';
import 'package:seekmax/features/job_details/domain/entities/job_details.dart';
import 'package:seekmax/features/job_details/domain/repositories/job_details_repository.dart';

class JobDetailsRepositoryImpl extends JobDetailsRepository with CustomErrorHandler {
  final JobDetailsRemoteDataSource remoteDataSource;
  JobDetailsRepositoryImpl({
    required this.remoteDataSource,
  });
  @override
  Future<Either<Failure, JobDetails>> fetchJobDetails({required String jobId}) async {
    try {
      final jobDetails = await remoteDataSource.fetchJobDetails(
        jobId: jobId,
      );
      return right(jobDetails.job);
    } catch (e) {
      if (e is Exception) {
        return Left(mapCommonExceptionToFailure(e));
      }

      return Left(UnhandledFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> applyForJob({required String jobId}) async {
    try {
      final applyResult = await remoteDataSource.applyForJob(
        jobId: jobId,
      );
      return right(
        applyResult.apply,
      );
    } catch (e) {
      if (e is Exception) {
        return Left(mapCommonExceptionToFailure(e));
      }

      return Left(UnhandledFailure(message: e.toString()));
    }
  }
}
