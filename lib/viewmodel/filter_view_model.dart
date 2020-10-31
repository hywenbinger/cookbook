import 'package:flutter/material.dart';

class FilterViewModel extends ChangeNotifier {
  // 无谷蛋白
  bool _isGlutenFree = false;

  bool get isGlutenFree => _isGlutenFree;

  set isGlutenFree(bool value) {
    _isGlutenFree = value;
    notifyListeners();
  }

  // 不含乳糖
  bool _isLactoseFree = false;

  bool get isLactoseFree => _isLactoseFree;

  set isLactoseFree(bool value) {
    _isLactoseFree = value;
    notifyListeners();
  }

  // 普通素食主义
  bool _isVegetarian = false;

  bool get isVegetarian => _isVegetarian;

  set isVegetarian(bool value) {
    _isVegetarian = value;
    notifyListeners();
  }

  // 严格素食主义
  bool _isVegan = false;

  bool get isVegan => _isVegan;

  set isVegan(bool value) {
    _isVegan = value;
    notifyListeners();
  }
}
