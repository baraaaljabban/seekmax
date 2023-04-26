import 'package:dartz/dartz.dart';
import 'package:seekmax/core/errors/failures.dart';
import 'package:seekmax/features/login/domain/usecases/login.dart';

abstract class LoginRepository {
  Future<Either<Failure, void>> login({required LoginParams loginParams});
}
