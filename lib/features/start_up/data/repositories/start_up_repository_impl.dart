import 'package:dartz/dartz.dart';
import 'package:seekmax/core/errors/error_handler.dart';

import 'package:seekmax/core/errors/failures.dart';
import 'package:seekmax/features/start_up/data/datasources/start_up_local_data_source.dart';
import 'package:seekmax/features/start_up/domain/repositories/start_up_repository.dart';

class StartUpRepositoryImpl extends StartUpRepository with ErrorHandler {
  final StartUpLocalDataSource localDataSource;
  StartUpRepositoryImpl({
    required this.localDataSource,
  });
  @override
  Future<Either<Failure, bool>> isLoggedIn() {
    try {
      return Future.value(right(localDataSource.isUserLoggedIn()));
    } catch (e) {
      if (e is Exception) {
        return Future.value(
          Left(mapCommonExceptionToFailure(e)),
        );
      }
      return Future.value(
        Left(
          UnhandledFailure(
            className: e.runtimeType.toString(),
            message: e.toString(),
          ),
        ),
      );
    }
  }
}
