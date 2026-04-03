import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/feature/home/category_details/presentation/view/news/presentation/view/web_view_screen.dart';
import 'package:provider/provider.dart';

import '../../../../../../../../core/provider/settings/settings_provider.dart';
import '../../../../../../../../core/utils/app_color.dart';
import '../../../../../../../../core/utils/app_text.dart';
import '../../../../../../../../core/widget/main_loading_widget.dart';
import '../../data/model/news_response.dart';

class NewsBottomSheet extends StatelessWidget {
  final News news;

  const NewsBottomSheet({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    var size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.75,
      decoration: BoxDecoration(
        color: provider.isDark() ? AppColor.white : AppColor.black,
        borderRadius: BorderRadius.circular(size.width * .05),
      ),
      padding: EdgeInsets.symmetric(
        vertical: size.height * .015,
        horizontal: size.width * .04,
      ),
      margin: EdgeInsets.symmetric(
        horizontal: size.width * .04,
        vertical: size.height * .02,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: AspectRatio(
              aspectRatio: 13 / 9,
              child: CachedNetworkImage(
                imageUrl: news.urlToImage ?? "",

                fit: BoxFit.fill,
                placeholder: (context, url) => const MainLoadingWidget(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),

          SizedBox(height: size.height * .02),

          Expanded(
            child: SingleChildScrollView(
              child: Text(
                news.content ?? "",
                style: provider.isDark()
                    ? TextStyle(
                        color: AppColor.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      )
                    : TextStyle(
                        color: AppColor.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
              ),
            ),
          ),

          SizedBox(height: size.height * .015),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WebViewScreen(url: news.url ?? ""),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: provider.isDark()
                    ? AppColor.black
                    : AppColor.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.symmetric(vertical: size.height * .02),
              ),
              child: Text(
                "View Full Article",
                style: provider.isDark()
                    ? TextStyle(
                        color: AppColor.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      )
                    : TextStyle(
                        color: AppColor.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
