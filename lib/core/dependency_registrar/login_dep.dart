import 'package:seekmax/core/dependency_registrar/dependencies.dart';
import 'package:seekmax/features/login/data/datasources/login_local_data_source.dart';
import 'package:seekmax/features/login/data/datasources/login_remote_data_source.dart';
import 'package:seekmax/features/login/data/repositories/login_repository_impl.dart';
import 'package:seekmax/features/login/domain/repositories/login_repository.dart';
import 'package:seekmax/features/login/domain/usecases/login.dart';
import 'package:seekmax/features/login/presentation/bloc/login_bloc.dart';

Future<void> registerLoginDeps() async {
  sl.registerSingleton<LoginRemoteDataSource>(
    LoginRemoteDataSourceImpl(
      myGraphQLClient: sl(),
    ),
  );

  sl.registerFactory<LoginLocalDataSource>(
    () => LoginLocalDataSourceImpl(
      sharedPreferences: sl(),
    ),
  );
  sl.registerFactory<LoginRepository>(
    () => LoginRepositoryImpl(
      localDataSource: sl(),
      remoteDataSource: sl(),
    ),
  );

  sl.registerFactory<Login>(() => Login(repository: sl()));
  sl.registerLazySingleton<LoginBloc>(
    () => LoginBloc(
      login: sl(),
    ),
  );
}
