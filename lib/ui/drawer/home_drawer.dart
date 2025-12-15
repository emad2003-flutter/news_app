import 'package:flutter/material.dart';
import 'package:news_app/Provider/category_provider.dart';
import 'package:news_app/Provider/theme_provider.dart';
import 'package:news_app/ui/drawer/widgets/drawer_label.dart';
import 'package:news_app/ui/drawer/widgets/theme_bottom_sheet.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/app_styles.dart';
import 'package:news_app/utils/app_theme.dart';
import 'package:provider/provider.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    // Responsive design calculations
    var designWidth = 393;
    var width = MediaQuery.of(context).size.width;
    var designHeight = 720;
    var height = MediaQuery.of(context).size.height;

    var themeProvider = Provider.of<ThemeProvider>(context);
    var categoryProvider = Provider.of<CategoryProvider>(context);
    return Container(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 200 * (height / designHeight),
            color: AppColors.whiteColor,
            alignment: Alignment.center,
            child: Text(
              'News App',
              style: TextStyle(
                color: AppColors.blackColor,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 16 * (height / designHeight)),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16 * (width / designWidth),
            ),
            child: Column(
              children: [
                DrawerLabel(
                  title: 'Go To Home',
                  icon: Icons.home,
                  onTap: () {
                    categoryProvider.setSelectedCategory("none");
                    Navigator.pop(context);
                  },
                ),
                SizedBox(height: 16 * (height / designHeight)),
                Divider(color: AppColors.whiteColor),
                SizedBox(height: 16 * (height / designHeight)),
                DrawerLabel(
                  title: "Theme",
                  icon: Icons.light_mode,
                  onTap: () {},
                ),
                SizedBox(height: 8 * (height / designHeight)),
                InkWell(
                  onTap: () {
                    // Handle language selection
                    print(themeProvider.isDarkMode());
                    showThemeBottomSheet(context);
                  },
                  child: Container(
                    width: (361 / designWidth) * width,
                    height: (50 / designHeight) * height,
                    padding: EdgeInsets.symmetric(
                      horizontal: (16 / designWidth) * width,
                      vertical: (8 / designHeight) * height,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppColors.whiteColor, width: 2),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          themeProvider.currentTheme == AppTheme.lightTheme
                              ? "Light"
                              : "Dark",
                          style: AppStyles.bold20White,
                        ),
                        const Icon(
                          Icons.arrow_drop_down,
                          color: AppColors.whiteColor,
                          size: 40,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void showThemeBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => const ThemeBottomSheet(),
    );
  }
}
