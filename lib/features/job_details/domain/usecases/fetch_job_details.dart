import 'package:dartz/dartz.dart';
import 'package:seekmax/core/base_use_case.dart';
import 'package:seekmax/core/errors/failures.dart';
import 'package:seekmax/features/job_details/domain/entities/job_details.dart';
import 'package:seekmax/features/job_details/domain/repositories/job_details_repository.dart';

class FetchJobDetails extends UseCase<JobDetails, String> {
  final JobDetailsRepository repository;
  FetchJobDetails({
    required this.repository,
  });
  @override
  Future<Either<Failure, JobDetails>> call({required String params}) async {
    return await repository.fetchJobDetails(jobId: params);
  }
}
