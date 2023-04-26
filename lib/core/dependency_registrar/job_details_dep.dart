import 'package:seekmax/features/job_details/data/datasources/job_details_remote_data_source.dart';
import 'package:seekmax/features/job_details/data/repositories/job_details_repository_imp.dart';
import 'package:seekmax/features/job_details/domain/repositories/job_details_repository.dart';
import 'package:seekmax/features/job_details/domain/usecases/fetch_job_details.dart';
import 'package:seekmax/features/job_details/presentation/cubit/job_details_cubit.dart';

import 'dependencies.dart';

Future<void> registerJobDetailsDeps() async {
  sl.registerSingleton<JobDetailsRemoteDataSource>(
    JobDetailsRemoteDataSourceImpl(
      client: sl(),
    ),
  );

  sl.registerFactory<JobDetailsRepository>(
    () => JobDetailsRepositoryImpl(
      remoteDataSource: sl(),
    ),
  );

  sl.registerFactory<FetchJobDetails>(() => FetchJobDetails(repository: sl()));
  sl.registerLazySingleton<JobDetailsCubit>(
    () => JobDetailsCubit(
      fetchJobDetails: sl(),
    ),
  );
}
