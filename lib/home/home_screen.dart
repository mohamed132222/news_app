import 'package:flutter/material.dart';
import 'package:news_app/drawer/drawer_home.dart';
import 'package:news_app/home/category/category_details_screen.dart';
import 'package:news_app/home/category/category_fragment.dart';
import 'package:news_app/utils/app_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home", style: AppText.medium20white500)),
      drawer: Drawer(child: DrawerHome()),
      body: CategoryFragment(),
    );
  }
}
