// class FetchJobDetails extends UseCase<JobDetails, String> {
//   final JobDetailsRepository repository;
//   FetchJobDetails({
//     required this.repository,
//   });
//   @override
//   Future<Either<Failure, JobDetails>> call({required String params}) async {
//     return await repository.fetchJobDetails(jobId: params);
//   }
// }
