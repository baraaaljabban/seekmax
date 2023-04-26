// ignore_for_file: annotate_overrides, overridden_fields

import 'dart:convert';

import 'package:seekmax/features/available_jobs/domain/entities/job.dart';
import 'package:seekmax/features/available_jobs/domain/entities/salary_rang.dart';

// class AvailableJobsResponse {
//   Data data;

//   AvailableJobsResponse({
//     required this.data,
//   });

//   factory AvailableJobsResponse.fromMap(Map<String, dynamic> map) {
//     return AvailableJobsResponse(
//       data: Data.fromMap(map['data']),
//     );
//   }

//   factory AvailableJobsResponse.fromJson(String source) => AvailableJobsResponse.fromMap(json.decode(source));
// }

class AvailableJobsResponse {
  Jobs jobs;

  AvailableJobsResponse({
    required this.jobs,
  });

  factory AvailableJobsResponse.fromMap(Map<String, dynamic> map) {
    return AvailableJobsResponse(
      jobs: Jobs.fromMap(map['jobs']),
    );
  }

  factory AvailableJobsResponse.fromJson(String source) => AvailableJobsResponse.fromMap(json.decode(source));
}

class Jobs {
  List<JobModel> jobs;

  Jobs({
    required this.jobs,
  });

  factory Jobs.fromMap(Map<String, dynamic> map) {
    return Jobs(
      jobs: List<JobModel>.from(map['jobs']?.map((x) => JobModel.fromMap(x))),
    );
  }

  factory Jobs.fromJson(String source) => Jobs.fromMap(json.decode(source));
}

class JobModel extends Job {
  String description;
  String positionTitle;
  // SalaryRangeModel salaryRangeModel;
  String id;
  JobModel({
    required this.description,
    required this.positionTitle,
    // required this.salaryRangeModel,
    required this.id,
  }) : super(
          description: description,
          positionTitle: positionTitle,
          // salaryRange: salaryRangeModel,
          jobID: id,
        );

  factory JobModel.fromMap(Map<String, dynamic> map) {
    return JobModel(
      description: map['description'] ?? '',
      id: map['_id'] ?? '',
      positionTitle: map['positionTitle'] ?? '',
      // salaryRangeModel: SalaryRangeModel.fromMap(map['salaryRange']),
    );
  }

  factory JobModel.fromJson(String source) => JobModel.fromMap(json.decode(source));
}

class SalaryRangeModel extends SalaryRange {
  int min;
  int max;

  SalaryRangeModel({
    required this.min,
    required this.max,
  }) : super(
          max: max,
          min: min,
        );

  factory SalaryRangeModel.fromMap(Map<String, dynamic> map) {
    return SalaryRangeModel(
      min: map['min']?.toInt() ?? 0,
      max: map['max']?.toInt() ?? 0,
    );
  }

  factory SalaryRangeModel.fromJson(String source) => SalaryRangeModel.fromMap(json.decode(source));
}
