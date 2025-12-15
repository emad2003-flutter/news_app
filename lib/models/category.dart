import 'package:news_app/utils/app_assets.dart';

class Category {
  String id;
  String title;
  String image;

  Category({required this.id, required this.title, required this.image});

  static List<Category> getCategories(bool isDarkMode) {
    return [
      Category(
        id: 'general',
        title: 'General',
        image: isDarkMode ? AppAssets.generalLight : AppAssets.generalDark,
      ),

      Category(
        id: 'business',
        title: 'Business',
        image: isDarkMode ? AppAssets.businessLight : AppAssets.businessDark,
      ),

      Category(
        id: 'sports',
        title: 'Sports',
        image: isDarkMode ? AppAssets.sportsLight : AppAssets.sportsDark,
      ),
      Category(
        id: 'health',
        title: 'Health',
        image: isDarkMode ? AppAssets.helthLight : AppAssets.helthDark,
      ),

      Category(
        id: 'entertainment',
        title: 'Entertainment',
        image: isDarkMode
            ? AppAssets.entertainmentLight
            : AppAssets.entertainmentDark,
      ),

      Category(
        id: 'technology',
        title: 'Technology',
        image: isDarkMode ? AppAssets.techLight : AppAssets.techDark,
      ),
      Category(
        id: 'science',
        title: 'Science',
        image: isDarkMode ? AppAssets.sinceLight : AppAssets.sinceDark,
      ),
    ];
  }
}
