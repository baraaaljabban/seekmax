import 'package:dartz/dartz.dart';
import 'package:seekmax/core/errors/failures.dart';

abstract class ProfileRepository {
  Future<Either<Failure, void>> logout();
}
