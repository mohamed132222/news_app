import 'package:flutter/material.dart';
import 'package:news_app/drawer/drawer_home.dart';
import 'package:news_app/home/category/category_details_screen.dart';
import 'package:news_app/home/category/category_fragment.dart';
import 'package:news_app/models/category.dart';
import 'package:news_app/utils/app_text.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          selectedCategory == null ? "Home" : selectedCategory?.title ?? "",
          style: AppText.medium20white500,
        ),
      ),
      drawer: Drawer(child: DrawerHome(OnDrawerClick: onDrawerClick)),
      body: selectedCategory == null
          ? CategoryFragment(onCategoryClick: onCategoryClick)
          : CategoryDetailsScreen(category: selectedCategory!),
    );
  }

  Category? selectedCategory;

  void onCategoryClick(Category newSelectedCategory) {
    selectedCategory = newSelectedCategory;
    setState(() {});
  }

  void onDrawerClick() {
    selectedCategory = null;
    Navigator.pop(context);
    setState(() {});
  }
}
