import 'package:dartz/dartz.dart';
import 'package:seekmax/core/errors/failures.dart';
import 'package:seekmax/features/available_jobs/domain/entities/job.dart';

abstract class AvailableJobsRepository {
  Future<Either<Failure, List<Job>>> fetchAvailableJobs({required int page});
}
