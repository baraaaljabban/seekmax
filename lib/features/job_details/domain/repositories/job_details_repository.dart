import 'package:dartz/dartz.dart';
import 'package:seekmax/core/errors/failures.dart';
import 'package:seekmax/features/job_details/domain/entities/job_details.dart';

abstract class JobDetailsRepository {
  Future<Either<Failure, JobDetails>> fetchJobDetails({required String jobId});
}
