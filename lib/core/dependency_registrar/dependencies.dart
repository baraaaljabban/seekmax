import 'package:get_it/get_it.dart';
import 'package:seekmax/core/dependency_registrar/shared_dep.dart';
import 'package:seekmax/core/dependency_registrar/start_up.dart';

import 'available_jobs_dep.dart';
import 'job_details_dep.dart';
import 'login_dep.dart';

final sl = GetIt.instance;

Future<void> slInit() async {
  await registerSharedDep();
  registerStartUpDep();
  registerLoginDeps();

  registerAvailableJobsDeps();
  registerJobDetailsDeps();
}
