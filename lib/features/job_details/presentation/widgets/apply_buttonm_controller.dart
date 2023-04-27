import 'package:flutter/material.dart';
import 'package:seekmax/core/theme/app_dimensions.dart';
import 'package:seekmax/core/theme/app_syle.dart';

import 'package:seekmax/core/theme/theme_color.dart';

class ApplyButtonController extends StatefulWidget {
  final bool hasApplied;
  const ApplyButtonController({
    Key? key,
    required this.hasApplied,
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
      onPressed: widget.hasApplied ? null : () {},
      child: Text(
        'Apply',
        style: AppStyle.largeRegular.copyWith(
          color: widget.hasApplied ? Colors.grey : Colors.white,
        ),
      ),
    );
    ;
  }
}
