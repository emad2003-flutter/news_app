import 'package:flutter/material.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/app_styles.dart';

class DrawerLabel extends StatelessWidget {
  String title;
  IconData icon;
  VoidCallback onTap;

  DrawerLabel({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Row(
        children: [
          Icon(icon, color: AppColors.whiteColor),
          SizedBox(width: 10),
          Text(title, style: AppStyles.bold20White),
        ],
      ),
    );
  }
}
