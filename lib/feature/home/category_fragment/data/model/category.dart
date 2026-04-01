import '../../../../../core/utils/app_asset.dart';

class Category {
  String id;
  String title;
  String image;

  Category({required this.id, required this.title, required this.image});

  /*
business entertainment general health science sports technology
*/
  static getCategoriesList(bool isDark) {
    return [
      Category(
        id: "general",
        title: "General",
        image: isDark ? AppAsset.general : AppAsset.generalDark,
      ),
      Category(
        id: "business",
        title: "Business",
        image: isDark ? AppAsset.business : AppAsset.businessDark,
      ),
      Category(
        id: "sports",
        title: "Sports",
        image: isDark ? AppAsset.sports : AppAsset.sportsDark,
      ),
      Category(
        id: "technology",
        title: "Technology",
        image: isDark ? AppAsset.technology : AppAsset.technologyDark,
      ),
      Category(
        id: "entertainment",
        title: "Entertainment",
        image: isDark ? AppAsset.entertainment : AppAsset.entertainmentDark,
      ),

      Category(
        id: "health",
        title: "Health",
        image: isDark ? AppAsset.health : AppAsset.healthDark,
      ),
      Category(
        id: "science",
        title: "Science",
        image: isDark ? AppAsset.science : AppAsset.scienceDark,
      ),
    ];
  }
}
