import 'package:dartz/dartz.dart';
import 'package:seekmax/core/errors/error_handler.dart';
import 'package:seekmax/features/available_jobs/domain/entities/job.dart';
import 'package:seekmax/core/errors/failures.dart';
import 'package:seekmax/features/available_jobs/domain/repositories/available_jobs_repository.dart';

class AvailableJobsRepositoryImpl extends AvailableJobsRepository with CustomErrorHandler {
  @override
  Future<Either<Failure, List<Job>>> fetchAvailableJobs() {
    throw UnimplementedError();
  }
}
