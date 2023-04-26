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
      final loginResponse = await remoteDataSource.fetchJobDetails(
        jobId: jobId,
      );
      return right(loginResponse.job);
    } catch (e) {
      if (e is Exception) {
        return Left(mapCommonExceptionToFailure(e));
      }

      return Left(UnhandledFailure(message: e.toString()));
    }
  }
}
