import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seekmax/core/theme/app_dimensions.dart';
import 'package:seekmax/core/theme/app_syle.dart';

import 'package:seekmax/core/theme/theme_color.dart';
import 'package:seekmax/features/profile/presentation/cubit/profile_cubit.dart';

class LogoutButtonController extends StatefulWidget {
  const LogoutButtonController({
    Key? key,
  }) : super(key: key);

  @override
  State<LogoutButtonController> createState() => _LogoutButtonControllerState();
}

class _LogoutButtonControllerState extends State<LogoutButtonController> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            ThemeColor.buttonBackground;
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
      onPressed: () {
        BlocProvider.of<ProfileCubit>(context).onLogout();
      },
      child: Text(
        'Logout',
        style: AppStyle.largeRegular.copyWith(
          color: Colors.white,
        ),
      ),
    );
    ;
  }
}
