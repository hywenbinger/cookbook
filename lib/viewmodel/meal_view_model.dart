import 'package:cookbook/model/meal_detail_model.dart';
import 'package:cookbook/utils/http/meal_list_request.dart';
import 'package:flutter/material.dart';

/// 美食列表对应的ViewModel
///
/// 知识点：
///     1.Provider
///     2.ChangeNotifier
class MealViewModel extends ChangeNotifier {
  List<MealDetailModel> _mealList = [];

  List<MealDetailModel> get mealList {
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
