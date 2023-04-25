import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seekmax/core/dependency_registrar/dependencies.dart';
import 'package:seekmax/features/app/presentation/cubit/app_cubit.dart';
import 'package:seekmax/features/home/presentation/bloc/home_bloc.dart';
import 'package:seekmax/features/home/presentation/pages/home_page.dart';
import 'package:seekmax/features/login/presentation/bloc/login_bloc.dart';
import 'package:seekmax/features/login/presentation/pages/login_page.dart';

class AppPage extends StatefulWidget {
  const AppPage({
    super.key,
  });

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider<HomeBloc>(
            create: (context) => sl.get<HomeBloc>(),
          ),
          BlocProvider<LoginBloc>(
            create: (context) => sl.get<LoginBloc>(),
          ),
        ],
        child: Scaffold(body: BlocBuilder<AppCubit, AppState>(
          builder: (context, state) {
            return state is AppIsLoggedInState
                ? state.isLoggedIn
                    ? const HomePage()
                    : const LoginPage()
                : const Center(
                    child: CircularProgressIndicator(),
                  );
          },
        )),
      ),
    );
  }
}
