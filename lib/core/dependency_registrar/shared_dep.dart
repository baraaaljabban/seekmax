import 'dart:async';

import 'package:seekmax/core/constant/constants.dart';
import 'package:seekmax/core/network/connection_checker.dart';
import 'package:seekmax/features/start_up/data/datasources/start_up_local_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'dependencies.dart';

Future<void> registerSharedDep() async {
  await initHiveForFlutter();
  var httpLink = HttpLink(
    baseUrl,
    defaultHeaders: h,
  );

  final authLink = AuthLink(
    getToken: () async => 'Bearer ${sl.get<StartUpLocalDataSource>().getCachedJwtAccessToken()}',
  );

  var link = authLink.concat(httpLink);

  sl.registerLazySingleton<MyGraphQLClient>(
    () => MyGraphQLClient(
      link: link,
      cache: GraphQLCache(store: HiveStore()),
    ),
  );

  var sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  sl.registerLazySingleton<ConnectionChecker>(() => ConnectionCheckerImpl());
}

class MyGraphQLClient extends GraphQLClient {
  MyGraphQLClient({required super.link, required super.cache});
}

var h = {
  "access-control-allow-origin": "*",
  "cache-control": "no-store",
  "connection": "keep-alive",
  "content-type": "application/json; charset=utf-8",
  // "etag": "W/\"c9-5AWsoewgDBRfWo6JjWUkJJUJt+s\"",
  // "keep-alive": "timeout=5",
  "x-powered-by": "Express"
};
