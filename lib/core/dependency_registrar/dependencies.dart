import 'package:get_it/get_it.dart';
import 'package:seekmax/core/dependency_registrar/shared_dep.dart';

final sl = GetIt.instance;

Future<void> slInit() async {
  await registerSharedDep();
  // registerPopularMoviesDeps();
}
