import 'package:dartz/dartz.dart';
import 'package:seekmax/core/base_use_case.dart';
import 'package:seekmax/core/errors/failures.dart';
import 'package:seekmax/features/start_up/domain/repositories/start_up_repository.dart';

/// [LoggedIn] use case is used to check wither the user is already logged in or not
/// return in the right hand [bool] with either values true/false based on saved JWT-token.
/// if anything wrong hStartUpen during checking if user is logged in or not a [Failure]
/// object will return.
class LoggedIn extends UseCase<bool, void> {
  StartUpRepository repository;
  LoggedIn({
    required this.repository,
  });

  @override
  Future<Either<Failure, bool>> call({void params}) {
    return repository.isLoggedIn();
  }
}
