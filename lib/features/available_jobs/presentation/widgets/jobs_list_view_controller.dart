import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:seekmax/features/available_jobs/domain/entities/job.dart';
import 'package:seekmax/features/available_jobs/presentation/cubit/available_jobs_cubit.dart';
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
  final _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget.jobs.length + 1,
      scrollDirection: Axis.vertical,
      controller: _scrollController,
      itemBuilder: (context, index) {
        if (index < widget.jobs.length) {
          return JobCard(
            job: widget.jobs[index],
            index: index,
          );
        } else {
          return Container(
            margin: EdgeInsets.all(16),
            child: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      BlocProvider.of<AvailableJobsCubit>(context).loadMoreJobsList();
    }
  }
}
