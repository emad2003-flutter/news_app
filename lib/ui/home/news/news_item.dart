import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/news_response.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/app_styles.dart';

class NewsItem extends StatelessWidget {
  News news;
  NewsItem({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    // Responsive design calculations
    var designWidth = 393;
    var deviceWidth = MediaQuery.of(context).size.width;
    var designHeight = 720;
    var deviceHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        SizedBox(height: 8 * deviceHeight / designHeight),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: 8 * deviceWidth / designWidth,
            vertical: 8 * deviceHeight / designHeight,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: Theme.of(context).indicatorColor,
              width: 1,
            ),
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: CachedNetworkImage(
                  imageUrl: news.urlToImage ?? '',
                  placeholder: (context, url) =>
                      CircularProgressIndicator(color: AppColors.greyColor),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              SizedBox(height: 8 * deviceHeight / designHeight),
              Text(
                news.title ?? '',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              SizedBox(height: 8 * deviceHeight / designHeight),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'By: ${news.author ?? 'Unknown'}',
                      style: AppStyles.bold14Grey,
                    ),
                  ),
                  Spacer(),
                  Expanded(
                    child: Text(
                      news.publishedAt?.substring(0, 10) ?? '',
                      style: AppStyles.bold14Grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
