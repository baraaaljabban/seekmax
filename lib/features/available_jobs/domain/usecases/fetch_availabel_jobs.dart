import 'package:dartz/dartz.dart';

import 'package:seekmax/core/base_use_case.dart';
import 'package:seekmax/core/errors/failures.dart';
import 'package:seekmax/features/available_jobs/domain/entities/job.dart';
import 'package:seekmax/features/available_jobs/domain/repositories/available_jobs_repository.dart';

class FetchAvailableJobs extends UseCase<List<Job>, void> {
  final AvailableJobsRepository repository;
  FetchAvailableJobs({
    required this.repository,
  });
  @override
  Future<Either<Failure, List<Job>>> call({void params}) async {
    return await repository.fetchAvailableJobs();
  }
}
