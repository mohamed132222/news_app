import 'package:flutter/material.dart';

import 'app_color.dart';
import 'app_text.dart';

class AppTheming {
  static ThemeData darkTheme = ThemeData(
    primaryColor: AppColor.white,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColor.black,
      centerTitle: true,
      elevation: 0,

      iconTheme: IconThemeData(color: AppColor.white),
    ),
    scaffoldBackgroundColor: AppColor.black,
    textTheme: TextTheme(
      headlineLarge: AppText.bold24black700,
      //news app
      headlineMedium: AppText.medium24white500,
      //good morining
      titleMedium: AppText.bold20white700,
      //go to home
      titleLarge: AppText.medium20white500,
      //home dark
      labelMedium: AppText.bold16white700,
      //tabpar title /title news
      labelSmall: AppText.medium12grey500,
      //author time
      displaySmall: AppText.medium14white500,
      bodyMedium: AppText.medium14black500,
      //bottom sheet news content
      bodySmall: AppText.bold16white700, //view full articles
    ),
  );
  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColor.black,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColor.white,
      centerTitle: true,
      elevation: 0,

      iconTheme: IconThemeData(color: AppColor.black),
    ),
    scaffoldBackgroundColor: AppColor.white,
    textTheme: TextTheme(
      headlineLarge: AppText.bold24black700,
      //news app
      headlineMedium: AppText.medium24black500,
      //good morining
      titleMedium: AppText.bold20white700,
      //go to home
      titleLarge: AppText.medium20black500,
      //home dark
      displaySmall: AppText.medium14black500,
      labelMedium: AppText.bold16black700,
      //tabpar title /title news
      labelSmall: AppText.medium12grey500,
      //author time
      bodyMedium: AppText.medium14white500,
      //bottom sheet news content
      bodySmall: AppText.bold16black700, //view full articles
    ),
  );
}
