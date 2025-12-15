import 'package:flutter/material.dart';
import 'package:news_app/Provider/theme_provider.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/app_theme.dart';
import 'package:provider/provider.dart';

class ThemeBottomSheet extends StatelessWidget {
  const ThemeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var designWidth = 393;
    var width = MediaQuery.of(context).size.width;
    var designHeight = 720;
    var height = MediaQuery.of(context).size.height;
    var themeProvider = Provider.of<ThemeProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: (16 / designWidth) * width,
        vertical: (24 / designHeight) * height,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: () {
              // Todo: Change theme to light
              themeProvider.changeLocale(AppTheme.lightTheme);
              Navigator.pop(context);
            },
            child: themeProvider.currentTheme == AppTheme.lightTheme
                ? getSelectedItemWidget(context, "Light")
                : getUnSelectedItemWidget(context, "Light"),
          ),
          SizedBox(height: height * 0.02),
          InkWell(
            onTap: () {
              themeProvider.changeLocale(AppTheme.darkTheme);
              Navigator.pop(context);
            },
            child: themeProvider.currentTheme == AppTheme.darkTheme
                ? getSelectedItemWidget(context, "Dark")
                : getUnSelectedItemWidget(context, "Dark"),
          ),
        ],
      ),
    );
  }

  Widget getSelectedItemWidget(BuildContext context, String theme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          theme,
          style: Theme.of(
            context,
          ).textTheme.headlineLarge!.copyWith(color: AppColors.greyColor),
        ),
        const Icon(Icons.check, color: AppColors.greyColor, size: 40),
      ],
    );
  }

  Widget getUnSelectedItemWidget(BuildContext context, String theme) {
    return Text(theme, style: Theme.of(context).textTheme.headlineLarge);
  }
}
