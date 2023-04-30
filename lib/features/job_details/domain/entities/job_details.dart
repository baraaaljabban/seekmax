class JobDetails {
  SalaryRange salaryRange;
  String positionTitle;
  int location;
  int industry;
  bool haveIApplied;
  String description;
  String id;

  JobDetails({
    required this.salaryRange,
    required this.positionTitle,
    required this.location,
    required this.industry,
    required this.haveIApplied,
    required this.description,
    required this.id,
  });
}

class SalaryRange {
  int min;
  int max;

  SalaryRange({
    required this.min,
    required this.max,
  });
}
