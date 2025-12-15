import 'package:flutter/material.dart';
import 'package:news_app/Provider/category_provider.dart';
import 'package:news_app/models/category.dart';
import 'package:news_app/ui/home/category_fragment_item.dart';
import 'package:provider/provider.dart';

class CategoryFragment extends StatelessWidget {
  List<Category> categoriesList = [];

  @override
  Widget build(BuildContext context) {
    var categoryProvider = Provider.of<CategoryProvider>(context);
    // Responsive design calculations
    var designWidth = 393;
    var width = MediaQuery.of(context).size.width;
    var designHeight = 720;
    var height = MediaQuery.of(context).size.height;
    categoriesList = Category.getCategories(
      Theme.of(context).brightness == Brightness.dark,
    );
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 8 * (width / designWidth),
        vertical: 8 * (height / designHeight),
      ),
      child: Column(
        children: [
          Text(
            'Good Morning,\nHere is Come of News For You',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          SizedBox(height: 16 * (height / designHeight)),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return CategoryFragmentItem(
                  categoriesList: categoriesList,
                  index: index,
                );
              },
              itemCount: categoriesList.length,
            ),
          ),
        ],
      ),
    );
  }
}
