import 'package:flutter/material.dart';
import 'package:seekmax/core/theme/app_dimensions.dart';
import 'package:seekmax/core/theme/theme_color.dart';

mixin LoginOutlineInputBorder {
  OutlineInputBorder enableBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.grey, width: AppDimensions.one),
      borderRadius: BorderRadius.circular(AppDimensions.xs),
    );
  }

  OutlineInputBorder foucuseBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: ThemeColor.buttonBackground, width: AppDimensions.one),
      borderRadius: BorderRadius.circular(AppDimensions.xs),
    );
  }
}
