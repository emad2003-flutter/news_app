import 'package:flutter/material.dart';
import 'package:news_app/Provider/category_provider.dart';
import 'package:news_app/models/source_response.dart';
import 'package:news_app/ui/drawer/home_drawer.dart';
import 'package:news_app/ui/home/categary%20details/categary_details.dart';
import 'package:news_app/ui/home/category_fragment.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home_screen";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Sources? source;
  @override
  Widget build(BuildContext context) {
    var categoryProvider = Provider.of<CategoryProvider>(context);
    return Scaffold(
      drawer: Drawer(
        backgroundColor: AppColors.blackColor,
        child: HomeDrawer(),
      ),
      appBar: AppBar(
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
        title: Text(
          categoryProvider.selectedCategory == "none"
              ? "Home"
              : categoryProvider.selectedCategory!,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: categoryProvider.selectedCategory == "none"
          ? CategoryFragment()
          : CategaryDetails(),
    );
  }
}
