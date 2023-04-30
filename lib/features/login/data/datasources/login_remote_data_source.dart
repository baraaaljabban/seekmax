import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:seekmax/core/dependency_registrar/shared_dep.dart';
import 'package:seekmax/core/errors/error_handler.dart';
import 'package:seekmax/features/login/data/models/login_response.dart';

abstract class LoginRemoteDataSource {
  Future<LoginResponse> login({
    required String email,
    required String password,
  });
}

class LoginRemoteDataSourceImpl extends LoginRemoteDataSource with CustomErrorHandler {
  final MyGraphQLClient myGraphQLClient;
  LoginRemoteDataSourceImpl({
    required this.myGraphQLClient,
  });

  @override
  Future<LoginResponse> login({required String email, required String password}) async {
    final mutation = gql('''
  mutation Mutation(\$username: String!, \$password: String!) {
    auth(username: \$username, password: \$password)
  }
''');

    //TODO : move it to a new class and call .toMap
    final variables = {
      'username': email,
      'password': password,
    };
    var result = await myGraphQLClient.mutate(MutationOptions(
      document: mutation,
      variables: variables,
    ));
    if (!result.hasException) {
      return LoginResponse.fromMap(result.data!);
    } else {
      throw gotNonSuccessResponse(result.exception!);
    }
  }
}
