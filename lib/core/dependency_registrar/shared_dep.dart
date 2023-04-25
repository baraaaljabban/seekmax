// ignore_for_file: import_of_legacy_library_into_null_safe

import 'dart:async';

import 'package:seekmax/core/network/connection_checker.dart';

import 'dependencies.dart';

Future<void> registerSharedDep() async {
  sl.registerLazySingleton<ConnectionChecker>(() => ConnectionCheckerImpl());
}
