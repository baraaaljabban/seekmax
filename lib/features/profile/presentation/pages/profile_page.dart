import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seekmax/core/navigation/nav_router.dart';
import 'package:seekmax/core/navigation/navigation_service.dart';
import 'package:seekmax/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:seekmax/features/profile/presentation/widgets/log_out_button_controller.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is ProfileLogoutState) {
          navigationService.pushAndRemoveUntil(
            NavRouter.loginRoute,
            checkSameRoute: true,
          );
        }
      },
      child: const Padding(
        padding: EdgeInsets.only(bottom: 16.0),
        child: Align(alignment: Alignment.bottomCenter, child: LogoutButtonController()),
      ),
    );
  }
}
