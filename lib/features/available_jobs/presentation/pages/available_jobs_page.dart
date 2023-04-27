import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seekmax/core/helper/snack_bar_helper.dart';
import 'package:seekmax/core/theme/theme_color.dart';
import 'package:seekmax/features/available_jobs/presentation/cubit/available_jobs_cubit.dart';
import 'package:seekmax/features/available_jobs/presentation/widgets/jobs_list_view_controller.dart';

class AvailableJobsPage extends StatefulWidget {
  const AvailableJobsPage({super.key});

  @override
  State<AvailableJobsPage> createState() => _AvailableJobsPageState();
}

class _AvailableJobsPageState extends State<AvailableJobsPage> with SnackBarHelper {
  @override
  void initState() {
    BlocProvider.of<AvailableJobsCubit>(context).fetchAvailableJobs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.backgroundSecondary,
      body: BlocConsumer<AvailableJobsCubit, AvailableJobsState>(
        listener: (context, state) {
          if (state is AvailableJobsErrorState) {
            showErrorSnackBar(context, message: state.message);
          }
        },
        builder: (context, state) {
          if (state is AvailableJobsLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is AvailableJobsSuccessState) {
            return JobsListViewController(jobs: state.jobs);
          }
          return Container();
        },
      ),
    );
  }
}
