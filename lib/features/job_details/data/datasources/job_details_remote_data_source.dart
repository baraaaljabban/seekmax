import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:seekmax/core/dependency_registrar/shared_dep.dart';
import 'package:seekmax/core/errors/error_handler.dart';
import 'package:seekmax/features/job_details/data/models/job_details_response.dart';

abstract class JobDetailsRemoteDataSource {
  Future<JobDetailsResponse> fetchJobDetails({required String jobId});
}

class JobDetailsRemoteDataSourceImpl extends JobDetailsRemoteDataSource with CustomErrorHandler {
  final MyGraphQLClient client;
  JobDetailsRemoteDataSourceImpl({
    required this.client,
  });

  @override
  Future<JobDetailsResponse> fetchJobDetails({required String jobId}) async {
    String query = r'''
      query Job($jobId: String!) {
        job(id: $jobId) {
          salaryRange {
            min
            max
          }
          positionTitle
          location
          industry
          haveIApplied
          description
          _id
        }
      }
    ''';

    final QueryOptions options = QueryOptions(
      document: gql(query),
      variables: <String, dynamic>{
        'jobId': jobId,
      },
    );

    final QueryResult result = await client.query(options);

    if (!result.hasException) {
      return JobDetailsResponse.fromMap(result.data!);
    } else {
      throw gotNonSuccessResponse(result.exception!);
    }
  }
}
