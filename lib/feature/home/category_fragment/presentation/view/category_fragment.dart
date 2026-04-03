import 'package:flutter/material.dart';
import 'package:news_app/feature/home/category_fragment/data/model/category.dart';
import 'package:provider/provider.dart';

import '../../../../../core/provider/settings/settings_provider.dart';
import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/app_text.dart';
import 'category_item.dart';

typedef OnCategoryClick = void Function(Category category);

class CategoryFragment extends StatelessWidget {
  List<Category> categoryList = [];
  OnCategoryClick onCategoryClick;

  CategoryFragment({required this.onCategoryClick});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    var height = MediaQuery.of(context).size.height;
    if (categoryList.isEmpty) {
      categoryList = Category.getCategoriesList(provider.isDark());
    }
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Good Morning\nHere is Some News For You",
              style: provider.isDark()
                  ? TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: AppColor.white,
                    )
                  : TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: AppColor.black,
                    ),
            ),
            SizedBox(height: height * .01),

            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  onCategoryClick(categoryList[index]);
                },
                child: CategoryItem(
                  category: categoryList[index],
                  index: index,
                ),
              ),
              separatorBuilder: (context, index) =>
                  SizedBox(height: height * .025),
              itemCount: categoryList.length,
            ),
          ],
        ),
      ),
    );
  }
}
