import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/utils/app_routing.dart';
import 'core/utils/app_theming.dart';
import 'core/utils/bloc_observer.dart';
import 'feature/home/home_screen.dart';

void main() {
  Bloc.observer = MyBlocObserver();
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
