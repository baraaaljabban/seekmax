import 'package:flutter/material.dart';
import 'package:seekmax/core/theme/theme_color.dart';

class AppStyle {
  AppStyle._();

  static TextStyle defaultStyle = const TextStyle(
    fontFamily: 'ProximaNova',
    color: ThemeColor.grey900,
  );

  static TextStyle title = defaultStyle.copyWith(fontSize: 14, fontWeight: FontWeight.w700);

  static TextStyle subtitle1 = defaultStyle.copyWith(fontSize: 14, fontWeight: FontWeight.w400);

  static TextStyle subtitle2 = defaultStyle.copyWith(fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1);

  static TextStyle subtitle3 = defaultStyle.copyWith(fontSize: 14, fontWeight: FontWeight.w400);

  static TextStyle h4 = defaultStyle.copyWith(fontSize: 24.0, fontWeight: FontWeight.w600, height: 1.33);

  static TextStyle h5 = defaultStyle.copyWith(fontSize: 20.0, fontWeight: FontWeight.w600, height: 1.33);

  static TextStyle h6 = defaultStyle.copyWith(fontSize: 18.0, fontWeight: FontWeight.w600, height: 1.33);

  static TextStyle xLargeSemibold = defaultStyle.copyWith(
    fontSize: 18.0,
    fontWeight: FontWeight.w600,
    height: 1.33,
  );

  static TextStyle largeSemibold = defaultStyle.copyWith(
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
    height: 1.375,
  );

  static TextStyle largeRegular = defaultStyle.copyWith(
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
    height: 1.5,
  );

  static TextStyle baseBold = defaultStyle.copyWith(
    color: ThemeColor.grey700,
    fontSize: 14.0,
    fontWeight: FontWeight.w700,
    height: 1.43,
  );

  static TextStyle baseSemibold = defaultStyle.copyWith(
    color: ThemeColor.grey700,
    fontSize: 14.0,
    fontWeight: FontWeight.w600,
    height: 1.43,
  );

  static TextStyle baseRegular = defaultStyle.copyWith(
    color: ThemeColor.grey700,
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    height: 1.43,
  );

  static TextStyle baseUnderline = defaultStyle.copyWith(
    color: ThemeColor.teal400,
    fontSize: 14.0,
    decoration: TextDecoration.underline,
  );

  static TextStyle smallBold = defaultStyle.copyWith(
    color: ThemeColor.grey400,
    fontSize: 12.0,
    fontWeight: FontWeight.w400,
    height: 1.5,
  );

  static TextStyle smallSemibold = defaultStyle.copyWith(
    color: ThemeColor.grey400,
    fontSize: 12.0,
    fontWeight: FontWeight.w600,
    height: 1.5,
  );

  static TextStyle smallRegular = defaultStyle.copyWith(
    color: ThemeColor.grey700,
    fontSize: 12.0,
    fontWeight: FontWeight.w400,
    height: 1.5,
  );

  static TextStyle miniSemibold = defaultStyle.copyWith(
    color: ThemeColor.grey400,
    fontSize: 11.0,
    fontWeight: FontWeight.w600,
    height: 1.45,
  );

  static TextStyle miniRegular = defaultStyle.copyWith(
    color: ThemeColor.grey400,
    fontSize: 11.0,
    fontWeight: FontWeight.w400,
    height: 1.22,
  );
  static TextStyle miniBold = defaultStyle.copyWith(
    color: ThemeColor.grey400,
    fontSize: 11.0,
    fontWeight: FontWeight.w700,
    height: 1.45,
  );
  static TextStyle emojiStyle = defaultStyle.copyWith(
    fontSize: 14.0,
    fontWeight: FontWeight.normal,
    height: 1.20,
  );
  static TextStyle microBold = defaultStyle.copyWith(
    color: ThemeColor.grey400,
    fontSize: 10,
    fontWeight: FontWeight.w700,
    height: 1.3,
  );
}
