import 'package:flutter/material.dart';
import 'package:news_app/ui/home/categary%20details/categary_details.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home_screen";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screens')),
      body: CategaryDetails(),
    );
  }
}
