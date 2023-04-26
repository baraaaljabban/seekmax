import 'package:flutter/material.dart';

import 'package:seekmax/features/available_jobs/domain/entities/job.dart';
import 'package:seekmax/features/available_jobs/presentation/widgets/job_card.dart';

class JobsListViewController extends StatefulWidget {
  final List<Job> jobs;
  const JobsListViewController({
    Key? key,
    required this.jobs,
  }) : super(key: key);

  @override
  State<JobsListViewController> createState() => _JobsListViewControllerState();
}

class _JobsListViewControllerState extends State<JobsListViewController> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget.jobs.length,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return JobCard(
          job: widget.jobs[index],
          index: index,
        );
      },
    );
  }
}
