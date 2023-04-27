import 'package:dartz/dartz.dart';
import 'package:seekmax/core/base_use_case.dart';
import 'package:seekmax/core/errors/failures.dart';
import 'package:seekmax/features/profile/domain/repositories/profile_repository.dart';

class Logout extends UseCase<void, void> {
  final ProfileRepository repository;
  Logout({
    required this.repository,
  });
  @override
  Future<Either<Failure, void>> call({void params}) async {
    return await repository.logout();
  }
}
