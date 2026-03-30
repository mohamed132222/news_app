import 'package:flutter/material.dart';
import 'package:news_app/models/category.dart';
import 'package:news_app/utils/app_color.dart';
import 'package:news_app/utils/app_text.dart';

class CategoryItem extends StatelessWidget {
  Category category;
  int index;

  CategoryItem({required this.category, required this.index});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.05,
        vertical: height * 0.005,
      ),
      margin: EdgeInsets.symmetric(horizontal: width * 0.01),

      width: width * 0.9,
      height: height * 0.25,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(width * 0.06),
        image: DecorationImage(
          image: AssetImage(category.image),
          fit: BoxFit.cover,
        ),
      ),

      child: Stack(
        alignment: index % 2 == 0
            ? Alignment.centerRight
            : Alignment.centerLeft,
        children: [
          Column(
            children: [
              SizedBox(height: height * 0.02),

              Text(
                category.title,
                style: AppText.bold24black700.copyWith(fontSize: width * 0.07),
              ),

              SizedBox(height: height * 0.08),

              Container(
                width: width * 0.4,

                decoration: BoxDecoration(
                  color: AppColor.grey,
                  borderRadius: BorderRadius.circular(width * 0.2),
                ),
                child: Row(
                  textDirection: index % 2 == 0
                      ? TextDirection.ltr
                      : TextDirection.rtl,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "View All",
                      style: AppText.medium24white500.copyWith(
                        fontSize: width * 0.045,
                      ),
                    ),
                    SizedBox(width: width * 0.05),

                    CircleAvatar(
                      radius: width * 0.06,
                      backgroundColor: AppColor.black,
                      foregroundColor: AppColor.white,
                      child: Icon(
                        index % 2 == 0
                            ? Icons.arrow_forward_ios
                            : Icons.arrow_back_ios,
                        size: width * 0.05,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
