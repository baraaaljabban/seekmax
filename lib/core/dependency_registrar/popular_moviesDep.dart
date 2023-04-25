// // ignore_for_file: file_names

// import 'package:movie_app/features/popular_movies/data/datasources/popular_movies_remote_data_source.dart';
// import 'package:movie_app/features/popular_movies/data/repositories/popular_movies_repository_impl.dart';
// import 'package:movie_app/features/popular_movies/domain/repositories/popular_movies_repository.dart';
// import 'package:movie_app/features/popular_movies/domain/usecases/get_popular_movies.dart';
// import 'package:movie_app/features/popular_movies/presentation/cubit/popular_movies_cubit.dart';

// import 'dependencies.dart';

// Future<void> registerPopularMoviesDeps() async {
//   sl.registerSingleton<PopularMoviesRemoteDataSource>(
//     PopularMoviesRemoteDataSourceImpl(
//       client: sl(),
//     ),
//   );

//   sl.registerFactory<PopularMoviesRepository>(
//     () => PopularMoviesRepositoryImpl(
//       remoteDataSource: sl(),
//     ),
//   );

//   sl.registerFactory(() => GetPopularMovies(repository: sl()));

//   sl.registerSingleton<PopularMoviesCubit>(
//     PopularMoviesCubit(
//       getPopularMovies: sl(),
//     ),
//   );
// }
