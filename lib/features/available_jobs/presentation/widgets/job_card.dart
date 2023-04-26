import 'package:flutter/material.dart';
import 'package:seekmax/core/navigation/nav_args.dart';
import 'package:seekmax/core/navigation/nav_router.dart';
import 'package:seekmax/core/navigation/navigation_service.dart';
import 'package:seekmax/core/theme/app_syle.dart';
import 'package:seekmax/core/theme/theme_color.dart';
import 'package:seekmax/features/available_jobs/domain/entities/job.dart';

class JobCard extends StatefulWidget {
  final Job job;
  final int index;
  const JobCard({
    super.key,
    required this.job,
    required this.index,
  });

  @override
  State<JobCard> createState() => _JobCardState();
}

class _JobCardState extends State<JobCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        navigationService.navigateTo(
          NavRouter.jobDetails,
          arguments: JobDetailsArgs(
            jobId: widget.job.jobID,
          ),
        ),
      },
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Card(
          margin: const EdgeInsets.only(left: 12, right: 12, top: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8),
                child: Text(
                  widget.job.positionTitle,
                  style: AppStyle.title,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8),
                child: Text(
                  "Company ${widget.index + 1}",
                  style: AppStyle.subtitle3.copyWith(
                    color: ThemeColor.textSecondary,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8),
                child: Text(
                  widget.job.description,
                  style: AppStyle.subtitle1,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
