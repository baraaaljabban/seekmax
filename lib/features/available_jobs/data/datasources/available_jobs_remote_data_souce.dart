import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:seekmax/core/dependency_registrar/shared_dep.dart';
import 'package:seekmax/core/errors/error_handler.dart';
import 'package:seekmax/features/available_jobs/data/models/available_jobs_response.dart';

abstract class AvailableJobsRemoteDataSource {
  Future<AvailableJobsResponse> fetchAvailableJobs();
}

class AvailableJobsRemoteDataSourceImpl extends AvailableJobsRemoteDataSource with CustomErrorHandler {
  final MyGraphQLClient client;
  AvailableJobsRemoteDataSourceImpl({
    required this.client,
  });

  @override
  Future<AvailableJobsResponse> fetchAvailableJobs() async {
    const String query = r'''
    query Jobs {
      jobs {
        jobs {
          description
          positionTitle
          salaryRange {
            min
            max
          }
        }
      }
    }
  ''';
    final QueryOptions options = QueryOptions(
      document: gql(query),
    );

    final QueryResult result = await client.query(options);

    if (!result.hasException) {
      return AvailableJobsResponse.fromMap(result.data!);
    } else {
      throw gotNonSuccessResponse(result.exception!);
    }
  }
}
