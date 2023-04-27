import 'package:flutter/material.dart';
import 'package:seekmax/core/theme/app_syle.dart';

import 'package:seekmax/features/job_details/domain/entities/job_details.dart';
import 'package:seekmax/features/job_details/presentation/widgets/apply_buttonm_controller.dart';

class JobDetailsController extends StatelessWidget {
  final JobDetails jobDetails;
  const JobDetailsController({
    Key? key,
    required this.jobDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8),
            child: Text(
              jobDetails.positionTitle,
              style: AppStyle.title,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(
                width: 16,
              ),
              const Text("Job description : "),
              const SizedBox(
                width: 8,
              ),
              Expanded(child: Text(jobDetails.description)),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(
                width: 16,
              ),
              const Text("Salary : "),
              const SizedBox(
                width: 8,
              ),
              Text("${jobDetails.salaryRange.min} - ${jobDetails.salaryRange.max} USD"),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(
                width: 16,
              ),
              const Text("Location : "),
              const SizedBox(
                width: 8,
              ),
              Text("${jobDetails.location}"),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(
                width: 16,
              ),
              const Text("Industry : "),
              const SizedBox(
                width: 8,
              ),
              Text("${jobDetails.industry}"),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          ApplyButtonController(
            hasApplied: jobDetails.haveIApplied,
            jobId: jobDetails.id,
          ),
        ],
      ),
    );
  }
}
