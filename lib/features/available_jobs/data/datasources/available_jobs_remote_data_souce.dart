import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:seekmax/core/dependency_registrar/shared_dep.dart';
import 'package:seekmax/core/errors/error_handler.dart';
import 'package:seekmax/features/available_jobs/data/models/available_jobs_response.dart';

abstract class AvailableJobsRemoteDataSource {
  Future<AvailableJobsResponse> fetchAvailableJobs({required int page});
}

class AvailableJobsRemoteDataSourceImpl extends AvailableJobsRemoteDataSource with CustomErrorHandler {
  final MyGraphQLClient client;
  AvailableJobsRemoteDataSourceImpl({
    required this.client,
  });

  @override
  Future<AvailableJobsResponse> fetchAvailableJobs({required int page}) async {
    String query = r'''
    query Jobs($page: Int, $limit: Int) {
      jobs(page: $page, limit: $limit) {
        page
        jobs {
          _id
          positionTitle
          description
        }
        hasNext
      }
    }
  ''';
    final QueryOptions options = QueryOptions(
      document: gql(query),
      variables: <String, dynamic>{
        'page': page,
        'limit': 7,
      },
    );

    final QueryResult result = await client.query(options);

    if (!result.hasException) {
      return AvailableJobsResponse.fromMap(result.data!);
    } else {
      throw gotNonSuccessResponse(result.exception!);
    }
  }
}
