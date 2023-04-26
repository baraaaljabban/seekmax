import 'dart:convert';

import 'package:seekmax/features/job_details/domain/entities/job_details.dart';

class JobDetailsResponse {
  JobDetailsModel job;

  JobDetailsResponse({
    required this.job,
  });

  factory JobDetailsResponse.fromMap(Map<String, dynamic> map) {
    return JobDetailsResponse(
      job: JobDetailsModel.fromMap(map['job']),
    );
  }

  factory JobDetailsResponse.fromJson(String source) => JobDetailsResponse.fromMap(json.decode(source));
}

class JobDetailsModel extends JobDetails {
  SalaryRangeModel salaryRangeModel;
  String positionTitle;
  int location;
  int industry;
  bool haveIApplied;
  String description;
  String id;

  JobDetailsModel({
    required this.salaryRangeModel,
    required this.positionTitle,
    required this.location,
    required this.industry,
    required this.haveIApplied,
    required this.description,
    required this.id,
  }) : super(
          salaryRange: salaryRangeModel,
          positionTitle: positionTitle,
          location: location,
          industry: industry,
          haveIApplied: haveIApplied,
          description: description,
          id: id,
        );

  factory JobDetailsModel.fromMap(Map<String, dynamic> map) {
    return JobDetailsModel(
      salaryRangeModel: SalaryRangeModel.fromMap(map['salaryRange']),
      positionTitle: map['positionTitle'] ?? '',
      location: map['location']?.toInt() ?? 0,
      industry: map['industry']?.toInt() ?? 0,
      haveIApplied: map['haveIApplied'] ?? false,
      description: map['description'] ?? '',
      id: map['id'] ?? '',
    );
  }

  factory JobDetailsModel.fromJson(String source) => JobDetailsModel.fromMap(json.decode(source));
}

class SalaryRangeModel extends SalaryRange {
  int min;
  int max;

  SalaryRangeModel({
    required this.min,
    required this.max,
  }) : super(
          min: min,
          max: max,
        );

  factory SalaryRangeModel.fromMap(Map<String, dynamic> map) {
    return SalaryRangeModel(
      min: map['min']?.toInt() ?? 0,
      max: map['max']?.toInt() ?? 0,
    );
  }

  factory SalaryRangeModel.fromJson(String source) => SalaryRangeModel.fromMap(json.decode(source));
}
// Generated by https://quicktype.io

 
