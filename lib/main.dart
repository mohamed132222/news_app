import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'core/provider/settings/settings_provider.dart';
import 'core/utils/app_routing.dart';
import 'core/utils/app_theming.dart';
import 'core/utils/bloc_observer.dart';
import 'feature/home/home_screen.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(
    ChangeNotifierProvider(
      child: MyApp(),
      create: (context) => SettingsProvider(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheming.lightTheme,
      darkTheme: AppTheming.darkTheme,
      themeMode: provider.appTheme,

      initialRoute: AppRouting.homeScreenRoute,
      routes: {AppRouting.homeScreenRoute: (context) => HomeScreen()},
    );
  }
}
