import 'package:flutter/material.dart';

import 'app_color.dart';
import 'app_text.dart';

class AppTheming {
  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColor.white,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColor.white,
      centerTitle: true,
      elevation: 0,
      titleTextStyle: AppText.medium20black500,
      iconTheme: IconThemeData(color: AppColor.black),
    ),
    scaffoldBackgroundColor: AppColor.white,
    textTheme: TextTheme(
      headlineLarge: AppText.medium24black500,
      headlineMedium: AppText.medium20black500,
      titleMedium: AppText.bold20white700,
      titleLarge: AppText.bold24black700,
      titleSmall: AppText.bold16black700,
      headlineSmall: AppText.bold16white700,
    ),
  );
  static ThemeData darkTheme = ThemeData(
    primaryColor: AppColor.black,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColor.black,
      centerTitle: true,
      elevation: 0,
      titleTextStyle: AppText.medium20white500,
      iconTheme: IconThemeData(color: AppColor.white),
    ),
    scaffoldBackgroundColor: AppColor.black,
    textTheme: TextTheme(
      headlineLarge: AppText.medium24white500,
      headlineMedium: AppText.medium20white500,
      titleMedium: AppText.bold20white700,
      titleLarge: AppText.medium24white500,
      titleSmall: AppText.medium14black500,
      headlineSmall: AppText.medium14white500,
    ),
  );
}
