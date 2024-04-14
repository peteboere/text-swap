import 'package:flutter/material.dart';
import './styles.dart';

ThemeData baseTheme() {

  final textStyle = TextStyle(
    color: AppColors.color,
    fontFamily: AppFonts.fontFamily,
  );

  return ThemeData(
    useMaterial3: true,
    primarySwatch: Colors.grey,
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.grey,
    ),
    textTheme: TextTheme(
      bodyLarge: textStyle.copyWith(fontSize: AppFontSizes.h1),
      bodyMedium: textStyle.copyWith(fontSize: 16),
      labelLarge: textStyle.copyWith(fontSize: 20),
    ),
  );
}
