import 'package:cookbook/model/meal_detail_model.dart';
import 'package:cookbook/utils/http/meal_list_request.dart';
import 'package:cookbook/viewmodel/filter_view_model.dart';
import 'package:flutter/material.dart';

/// 美食列表对应的ViewModel
///
/// 知识点：
///     1.Provider
///     2.ChangeNotifier
class MealViewModel extends ChangeNotifier {
  List<MealDetailModel> _mealList = [];

  FilterViewModel _filterVM;

  /// 每次修改 FilterViewModel，该方法就会调用
  void updateFilterViewModel(FilterViewModel filterVM) {
    print("updateFilterViewModel");
    _filterVM = filterVM;
  }

  List<MealDetailModel> get mealList {
    /// 通过 FilterViewModel 对美食列表进行过滤，返回的是过滤后的数据
    return _mealList.where((meal) {
      if (_filterVM.isGlutenFree && !meal.isGlutenFree) return false;
      if (_filterVM.isLactoseFree && !meal.isLactoseFree) return false;
      if (_filterVM.isVegetarian && !meal.isVegetarian) return false;
      if (_filterVM.isVegan && !meal.isVegan) return false;
      return true;
    }).toList();
  }

  List<MealDetailModel> get originMealList {
    /// 返回的是原始数据
    return _mealList;
  }

  MealViewModel() {
    MealRequest.getMealListData().then((value) {
      _mealList = value;
      print("----------美食列表----------");
      for (MealDetailModel model in value) {
        print(model.title);
      }
      print("----------美食列表----------");

      /// 通知所有的Consumer进行更新
      notifyListeners();
    });
  }
}
