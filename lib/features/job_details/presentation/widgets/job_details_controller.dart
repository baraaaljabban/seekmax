import 'package:flutter/material.dart';
import 'package:seekmax/core/theme/app_syle.dart';

import 'package:seekmax/features/job_details/domain/entities/job_details.dart';

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
          Padding(
            padding: const EdgeInsets.only(
              left: 8.0,
              right: 8,
            ),
            child: Text(
              jobDetails.description,
              style: AppStyle.subtitle1,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
