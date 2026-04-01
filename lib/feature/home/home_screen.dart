import 'package:flutter/material.dart';

import 'package:news_app/feature/home/category_fragment/data/model/category.dart';

import '../../core/utils/app_color.dart';
import '../../core/utils/app_text.dart';
import '../drawer/drawer_home.dart';
import '../search/presentation/view/show_search_delegate_screen.dart';
import 'category_details/presentation/view/category_details_screen.dart';
import 'category_fragment/presentation/view/category_fragment.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => showSearch(
              context: context,
              delegate: ShowSearchDelegateScreen(),
            ),
            icon: Icon(Icons.search, size: 25, color: AppColor.white),
          ),
        ],
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
