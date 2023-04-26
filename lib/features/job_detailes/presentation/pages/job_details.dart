import 'package:flutter/material.dart';
import 'package:seekmax/core/navigation/nav_args.dart';

class JobDetailsPage extends StatefulWidget {
  final JobDetailsArgs jobDetailsArgs;
  const JobDetailsPage({
    Key? key,
    required this.jobDetailsArgs,
  }) : super(key: key);

  @override
  State<JobDetailsPage> createState() => _JobDetailsPageState();
}

class _JobDetailsPageState extends State<JobDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
