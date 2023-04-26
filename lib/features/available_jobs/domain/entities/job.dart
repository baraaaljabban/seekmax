import 'package:seekmax/features/available_jobs/domain/entities/salary_rang.dart';

class Job {
  String description;
  String positionTitle;
  SalaryRange salaryRange;

  Job({
    required this.description,
    required this.positionTitle,
    required this.salaryRange,
  });
}
