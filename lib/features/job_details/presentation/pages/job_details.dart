import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seekmax/core/helper/snack_bar_helper.dart';
import 'package:seekmax/core/navigation/nav_args.dart';
import 'package:seekmax/core/theme/theme_color.dart';
import 'package:seekmax/features/job_details/presentation/cubit/job_details_cubit.dart';
import 'package:seekmax/features/job_details/presentation/widgets/job_details_controller.dart';

class JobDetailsPage extends StatefulWidget {
  final JobDetailsArgs jobDetailsArgs;
  const JobDetailsPage({
    Key? key,
    required this.jobDetailsArgs,
  }) : super(key: key);

  @override
  State<JobDetailsPage> createState() => _JobDetailsPageState();
}

class _JobDetailsPageState extends State<JobDetailsPage> with SnackBarHelper {
  @override
  void initState() {
    BlocProvider.of<JobDetailsCubit>(context).onFetchJobDetails(
      jobId: widget.jobDetailsArgs.jobId,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Job Detail"),
        centerTitle: true,
        backgroundColor: ThemeColor.brandBackground,
      ),
      body: BlocConsumer<JobDetailsCubit, JobDetailsState>(
        listener: (context, state) {
          if (state is JobDetailsFailedState) {
            showErrorSnackBar(context, message: state.message);
          }
        },
        builder: (context, state) {
          if (state is JobDetailsLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is JobDetailsSuccessfulState) {
            return JobDetailsController(jobDetails: state.jobDetails);
          }
          return Container();
        },
      ),
    );
  }
}
