import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seekmax/features/home/presentation/pages/home_page.dart';
import 'package:seekmax/features/login/presentation/pages/login_page.dart';
import 'package:seekmax/features/start_up/presentation/cubit/start_up_cubit.dart';

class StartUpPage extends StatefulWidget {
  const StartUpPage({super.key});

  @override
  State<StartUpPage> createState() => _StartUpPageState();
}

class _StartUpPageState extends State<StartUpPage> {
  @override
  void initState() {
    BlocProvider.of<StartUpCubit>(context).onStartUpStartUpEvent();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<StartUpCubit, StartUpState>(
        builder: (context, state) {
          return state is StartUpIsLoggedInState
              ? state.isLoggedIn
                  ? const HomePage()
                  : const LoginPage()
              : const Center(
                  child: CircularProgressIndicator(),
                );
        },
        // )),
      ),
    );
  }
}
