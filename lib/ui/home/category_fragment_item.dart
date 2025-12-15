import 'package:flutter/material.dart';
import 'package:news_app/Provider/category_provider.dart';
import 'package:news_app/models/category.dart';
import 'package:provider/provider.dart';

class CategoryFragmentItem extends StatelessWidget {
  List<Category> categoriesList;
  int index;
  CategoryFragmentItem({
    super.key,
    required this.categoriesList,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    // Responsive design calculations
    var designWidth = 393;
    var width = MediaQuery.of(context).size.width;
    var designHeight = 720;
    var height = MediaQuery.of(context).size.height;

    var categoryProvider = Provider.of<CategoryProvider>(context);

    return Column(
      children: [
        SizedBox(height: 8 * (height / designHeight)),
        Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
          child: Stack(
            children: [
              Image.asset(categoriesList[index].image, fit: BoxFit.cover),
              Container(
                width: double.infinity,
                padding: EdgeInsetsDirectional.symmetric(
                  vertical: 16 * (height / designHeight),
                  horizontal: 16 * (width / designWidth),
                ),
                child: Column(
                  crossAxisAlignment: index % 2 == 0
                      ? CrossAxisAlignment.end
                      : CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      categoriesList[index].title,
                      style: TextStyle(
                        color: Theme.of(context).hintColor,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 32 * (height / designHeight)),
                    InkWell(
                      child: viewAllButton(context),
                      onTap: () {
                        categoryProvider.setSelectedCategory(
                          categoriesList[index].title,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  //todo: view all button
  Widget viewAllButton(BuildContext context) {
    return Container(
      width: 169,
      height: 54,
      padding: const EdgeInsets.only(left: 16),
      decoration: BoxDecoration(
        color: Colors.grey.shade400,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        // mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'View All',
            style: TextStyle(
              color: Theme.of(context).indicatorColor,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          Container(
            width: 54,
            height: 54,
            decoration: BoxDecoration(
              color: Theme.of(context).hintColor,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.arrow_forward_ios,
              color: Theme.of(context).indicatorColor,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
