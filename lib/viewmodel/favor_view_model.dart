import 'package:cookbook/model/meal_detail_model.dart';
import 'package:flutter/material.dart';

/// 收藏列表对应的ViewModel
///
/// 知识点：
///     1.Provider
///     2.ChangeNotifier
class FavorViewModel extends ChangeNotifier {
  List<MealDetailModel> _mealList = [];

  List<MealDetailModel> get mealList {
    return _mealList;
  }

  void addMealToFavor(MealDetailModel model) {
    _mealList.add(model);
    notifyListeners();
  }

  void removeMealToFavor(MealDetailModel model) {
    _mealList.remove(model);
    notifyListeners();
  }

  bool isFavor(MealDetailModel model) {
    return _mealList.contains(model);
  }

  void handle(MealDetailModel model) {
    if (isFavor(model)) {
      removeMealToFavor(model);
    } else {
      addMealToFavor(model);
    }
  }
}
