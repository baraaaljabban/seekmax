import 'package:seekmax/features/profile/data/datasources/profile_local_data_source.dart';
import 'package:seekmax/features/profile/data/repositories/profile_repostiory_impl.dart';
import 'package:seekmax/features/profile/domain/repositories/profile_repository.dart';
import 'package:seekmax/features/profile/domain/usecases/logout.dart';
import 'package:seekmax/features/profile/presentation/cubit/profile_cubit.dart';

import 'dependencies.dart';

Future<void> registerProfileDep() async {
  sl.registerSingleton<ProfileLocalDataSource>(
    ProfileLocalDataSourceImpl(
      sharedPreferences: sl(),
    ),
  );

  sl.registerFactory<ProfileRepository>(
    () => ProfileRepositoryImpl(
      localDataSource: sl(),
    ),
  );

  sl.registerFactory<Logout>(() => Logout(repository: sl()));
  sl.registerFactory<ProfileCubit>(
    () => ProfileCubit(
      logout: sl(),
    ),
  );
}
