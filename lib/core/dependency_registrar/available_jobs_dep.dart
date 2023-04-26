import 'package:seekmax/core/dependency_registrar/dependencies.dart';
import 'package:seekmax/features/available_jobs/data/datasources/available_jobs_remote_data_souce.dart';
import 'package:seekmax/features/available_jobs/data/repositories/available_jobs_repository_impl.dart';
import 'package:seekmax/features/available_jobs/domain/repositories/available_jobs_repository.dart';
import 'package:seekmax/features/available_jobs/domain/usecases/fetch_available_jobs.dart';
import 'package:seekmax/features/available_jobs/presentation/cubit/available_jobs_cubit.dart';

Future<void> registerAvailableJobsDeps() async {
  sl.registerSingleton<AvailableJobsRemoteDataSource>(
    AvailableJobsRemoteDataSourceImpl(
      client: sl(),
    ),
  );

  sl.registerFactory<AvailableJobsRepository>(
    () => AvailableJobsRepositoryImpl(
      remoteDataSource: sl(),
    ),
  );

  sl.registerFactory<FetchAvailableJobs>(() => FetchAvailableJobs(repository: sl()));
  sl.registerLazySingleton<AvailableJobsCubit>(
    () => AvailableJobsCubit(
      availableJobs: sl(),
    ),
  );
}
