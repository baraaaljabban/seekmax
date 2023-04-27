import 'dart:ffi';

import 'package:seekmax/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:seekmax/features/profile/data/datasources/profile_local_data_source.dart';
import 'package:seekmax/features/profile/domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  final ProfileLocalDataSource localDataSource;
  ProfileRepositoryImpl({
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      localDataSource.clearJWTToken();
      // ignore: void_checks
      return const Right(Void);
    } catch (e) {
      return Left(UnhandledFailure(message: "any message for now"));
    }
  }
}
