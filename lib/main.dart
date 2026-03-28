import 'package:flutter/material.dart';
import 'package:news_app/home/home_screen.dart';
import 'package:news_app/utils/app_routing.dart';
import 'package:news_app/utils/app_theming.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheming.lightTheme,
      darkTheme: AppTheming.darkTheme,
      themeMode: ThemeMode.dark,
      initialRoute: AppRouting.homeScreenRoute,
      routes: {AppRouting.homeScreenRoute: (context) => HomeScreen()},
    );
  }
}
