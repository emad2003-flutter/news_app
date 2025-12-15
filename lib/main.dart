import 'package:flutter/material.dart';
import 'package:news_app/Provider/category_provider.dart';
import 'package:news_app/Provider/theme_provider.dart';
import 'package:news_app/models/category.dart';
import 'package:news_app/ui/home/home_screen.dart';
import 'package:news_app/utils/app_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CategoryProvider()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News App',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.currentTheme == AppTheme.lightTheme
          ? ThemeMode.light
          : ThemeMode.dark,
      initialRoute: HomeScreen.routeName,
      routes: {HomeScreen.routeName: (context) => const HomeScreen()},
    );
  }
}
