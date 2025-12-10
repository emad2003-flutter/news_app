import 'package:flutter/material.dart';
import 'package:news_app/models/source_response.dart';
import 'package:news_app/ui/home/categary%20details/categary_details.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text('Home', style: Theme.of(context).textTheme.headlineLarge),
      ),
      body: CategaryDetails(),
    );
  }
}
