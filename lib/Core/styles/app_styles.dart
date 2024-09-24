import 'package:flutter/material.dart';

import '../constant/out_line_input_border.dart';
import '../utils/app_colors.dart';

ThemeData themeData() {
  return ThemeData(
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: outLineInputBorder(),
      enabledBorder: outLineInputBorder(),
      filled: true,
      fillColor: AppColors.white,
      hintStyle: const TextStyle(
        fontWeight: FontWeight.w400,
        color: AppColors.grey9,
        fontSize: 14,
      ),
      suffixIconColor: AppColors.grey9,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.white,
      centerTitle: true,
      elevation: 0.0,
    ),
    fontFamily: "Tajawal",
    scaffoldBackgroundColor: AppColors.white,
  );
}
