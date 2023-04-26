import 'dart:convert';

class AvailableJobsResponse {
  Data data;

  AvailableJobsResponse({
    required this.data,
  });

  factory AvailableJobsResponse.fromMap(Map<String, dynamic> map) {
    return AvailableJobsResponse(
      data: Data.fromMap(map['data']),
    );
  }

  factory AvailableJobsResponse.fromJson(String source) => AvailableJobsResponse.fromMap(json.decode(source));
}

class Data {
  Jobs jobs;

  Data({
    required this.jobs,
  });

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      jobs: Jobs.fromMap(map['jobs']),
    );
  }

  factory Data.fromJson(String source) => Data.fromMap(json.decode(source));
}

class Jobs {
  List<Job> jobs;

  Jobs({
    required this.jobs,
  });

  factory Jobs.fromMap(Map<String, dynamic> map) {
    return Jobs(
      jobs: List<Job>.from(map['jobs']?.map((x) => Job.fromMap(x))),
    );
  }

  factory Jobs.fromJson(String source) => Jobs.fromMap(json.decode(source));
}

class Job {
  String description;
  String positionTitle;
  SalaryRange salaryRange;

  Job({
    required this.description,
    required this.positionTitle,
    required this.salaryRange,
  });

  factory Job.fromMap(Map<String, dynamic> map) {
    return Job(
      description: map['description'] ?? '',
      positionTitle: map['positionTitle'] ?? '',
      salaryRange: SalaryRange.fromMap(map['salaryRange']),
    );
  }

  factory Job.fromJson(String source) => Job.fromMap(json.decode(source));
}

class SalaryRange {
  int min;
  int max;

  SalaryRange({
    required this.min,
    required this.max,
  });

  factory SalaryRange.fromMap(Map<String, dynamic> map) {
    return SalaryRange(
      min: map['min']?.toInt() ?? 0,
      max: map['max']?.toInt() ?? 0,
    );
  }

  factory SalaryRange.fromJson(String source) => SalaryRange.fromMap(json.decode(source));
}
