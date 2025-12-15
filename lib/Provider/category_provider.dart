import 'package:flutter/material.dart';

class CategoryProvider extends ChangeNotifier {
  String _selectedCategory = "none";

  String get selectedCategory => _selectedCategory;

  void setSelectedCategory(String categoryId) {
    _selectedCategory = categoryId;
    notifyListeners();
  }
}
