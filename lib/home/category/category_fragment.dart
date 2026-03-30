import 'package:flutter/material.dart';
import 'package:news_app/home/category/category_item.dart';
import 'package:news_app/models/category.dart';
import 'package:news_app/utils/app_text.dart';

typedef OnCategoryClick = void Function(Category category);

class CategoryFragment extends StatelessWidget {
  List<Category> categoryList = [];
  OnCategoryClick onCategoryClick;

  CategoryFragment({required this.onCategoryClick});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    if (categoryList.isEmpty) {
      categoryList = Category.getCategoriesList(true);
    }
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Good Morning\nHere is Some News For You",
              style: AppText.medium24white500,
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
