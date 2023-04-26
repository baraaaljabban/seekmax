import 'package:seekmax/features/available_jobs/domain/entities/salary_rang.dart';

class Job {
  String description;
  String positionTitle;
  SalaryRange salaryRange;
  String jobID;
  Job({
    required this.description,
    required this.positionTitle,
    required this.salaryRange,
    required this.jobID,
  });
}
