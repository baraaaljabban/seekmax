import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seekmax/core/dependency_registrar/dependencies.dart';
import 'package:seekmax/features/available_jobs/presentation/cubit/available_jobs_cubit.dart';
import 'package:seekmax/features/home/presentation/bloc/home_bloc.dart';
import 'package:seekmax/features/login/presentation/bloc/login_bloc.dart';
import 'package:seekmax/features/start_up/presentation/cubit/start_up_cubit.dart';

class BaseBlocProviderWidget extends StatefulWidget {
  final Widget child;
  const BaseBlocProviderWidget({Key? key, required this.child}) : super(key: key);

  @override
  State<BaseBlocProviderWidget> createState() => _BaseBlocProviderWidgetState();
}

class _BaseBlocProviderWidgetState extends State<BaseBlocProviderWidget> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<StartUpCubit>(
          create: (context) => sl.get<StartUpCubit>(),
        ),
        BlocProvider<HomeBloc>(
          create: (context) => sl.get<HomeBloc>(),
        ),
        BlocProvider<LoginBloc>(
          create: (context) => sl.get<LoginBloc>(),
        ),
        BlocProvider<AvailableJobsCubit>(
          create: (context) => sl.get<AvailableJobsCubit>(),
        ),
      ],
      child: widget.child,
    );
  }
}
