// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seekmax/core/theme/app_dimensions.dart';
import 'package:seekmax/core/theme/app_syle.dart';

import 'package:seekmax/core/theme/theme_color.dart';
import 'package:seekmax/features/job_details/presentation/cubit/job_details_cubit.dart';

class ApplyButtonController extends StatefulWidget {
  bool hasApplied;
  final String jobId;
  ApplyButtonController({
    Key? key,
    required this.hasApplied,
    required this.jobId,
  }) : super(key: key);

  @override
  State<ApplyButtonController> createState() => _ApplyButtonControllerState();
}

class _ApplyButtonControllerState extends State<ApplyButtonController> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            widget.hasApplied ? Colors.grey[900] : ThemeColor.buttonBackground;
          },
        ),
        fixedSize: MaterialStateProperty.all(
          const Size(
            double.infinity,
            AppDimensions.c,
          ),
        ),
        shape: MaterialStateProperty.all(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                AppDimensions.xxs,
              ),
            ),
          ),
        ),
      ),
      onPressed: widget.hasApplied
          ? null
          : () {
              BlocProvider.of<JobDetailsCubit>(context).onApplyForJob();
            },
      child: BlocListener<JobDetailsCubit, JobDetailsState>(
        listener: (context, state) {
          if (state is ApplyResultState) {
            if (state.applied && widget.jobId == state.jobId) {
              setState(() {
                widget.hasApplied = true;
              });
            }
          }
        },
        child: Text(
          'Apply',
          style: AppStyle.largeRegular.copyWith(
            color: widget.hasApplied ? Colors.grey : Colors.white,
          ),
        ),
      ),
    );
    ;
  }
}
