import 'package:dartz/dartz.dart';
import 'package:seekmax/core/errors/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call({required Params params});
}
