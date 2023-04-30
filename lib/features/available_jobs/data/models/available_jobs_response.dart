// ignore_for_file: annotate_overrides, overridden_fields

import 'dart:convert';

import 'package:seekmax/features/available_jobs/domain/entities/job.dart';

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
  String id;
  bool haveIApplied;
  JobModel({
    required this.description,
    required this.positionTitle,
    required this.haveIApplied,
    required this.id,
  }) : super(
          description: description,
          positionTitle: positionTitle,
          haveIApplied: haveIApplied,
          jobID: id,
        );

  factory JobModel.fromMap(Map<String, dynamic> map) {
    return JobModel(
      description: map['description'] ?? '',
      id: map['_id'] ?? '',
      positionTitle: map['positionTitle'] ?? '',
      haveIApplied: map['haveIApplied'] ?? false,
    );
  }

  factory JobModel.fromJson(String source) => JobModel.fromMap(json.decode(source));
}
