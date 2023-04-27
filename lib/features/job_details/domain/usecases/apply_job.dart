import 'package:dartz/dartz.dart';
import 'package:seekmax/core/base_use_case.dart';
import 'package:seekmax/core/errors/failures.dart';
import 'package:seekmax/features/job_details/domain/repositories/job_details_repository.dart';

class ApplyForJob extends UseCase<bool, String> {
  final JobDetailsRepository repository;
  ApplyForJob({
    required this.repository,
  });
  @override
  Future<Either<Failure, bool>> call({required String params}) async {
    return await repository.applyForJob(jobId: params);
  }
}
