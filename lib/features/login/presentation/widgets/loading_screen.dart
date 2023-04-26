import 'package:flutter/material.dart';
import 'package:seekmax/core/theme/theme_color.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({
    this.size = 30,
    this.color = ThemeColor.teal400,
    Key? key,
  }) : super(key: key);

  final double size;

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: color,
        strokeWidth: size,
      ),
    );
  }
}
