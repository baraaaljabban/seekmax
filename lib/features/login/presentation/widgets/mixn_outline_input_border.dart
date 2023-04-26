import 'package:flutter/material.dart';
import 'package:seekmax/core/theme/app_dimensions.dart';
import 'package:seekmax/core/theme/theme_color.dart';

mixin LoginOutlineInputBorder {
  OutlineInputBorder enableBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: ThemeColor.grey300, width: AppDimensions.one),
      borderRadius: BorderRadius.circular(AppDimensions.xs),
    );
  }

  OutlineInputBorder foucuseBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: ThemeColor.teal400, width: AppDimensions.one),
      borderRadius: BorderRadius.circular(AppDimensions.xs),
    );
  }
}
