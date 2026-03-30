import 'package:flutter/material.dart';
import 'package:news_app/utils/app_color.dart';
import 'package:news_app/utils/app_text.dart';

class SelectedItem extends StatelessWidget {
  String title;
  VoidCallback onTap;

  SelectedItem({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return InkWell(
      onTap: onTap,

      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: height * 0.01,
          horizontal: width * 0.03,
        ),
        padding: EdgeInsets.symmetric(
          vertical: height * 0.012,
          horizontal: width * 0.04,
        ),

        width: width * 0.9,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(width * 0.04),
          border: Border.all(width: width * 0.004, color: AppColor.white),
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                style: AppText.medium20white500.copyWith(
                  fontSize: width * 0.045,
                ),
              ),
            ),

            SizedBox(width: width * 0.02),

            Icon(
              Icons.arrow_drop_down_outlined,
              color: AppColor.white,
              size: width * 0.07,
            ),
          ],
        ),
      ),
    );
  }
}
