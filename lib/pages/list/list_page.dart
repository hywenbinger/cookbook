import 'package:cookbook/model/meal_category_model.dart';
import 'package:cookbook/model/meal_detail_model.dart';
import 'package:cookbook/theme/app_theme.dart';
import 'package:cookbook/viewmodel/meal_view_model.dart';
import 'package:cookbook/widgets/meal_item.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// 美食列表页面
///
/// 知识点：
///     1.ModalRoute.of(context)
///     2.Selector获取共享数据
class ListPage extends StatelessWidget {
  static const String routeName = "/list";

  @override
  Widget build(BuildContext context) {
    /// 获取从【HomePage】传递过来的数据
    final mealCategoryModel =
        ModalRoute.of(context).settings.arguments as MealCategoryModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          mealCategoryModel.title,
        ),
      ),
      body: ListContent(),
    );
  }
}

class ListContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// 获取从【HomePage】传递过来的数据
    final mealCategoryModel =
        ModalRoute.of(context).settings.arguments as MealCategoryModel;

    /// Selector使用说明：
    ///     1.两个参数：【原始数据类型、转换后数据类型】
    ///     2.selector：
    ///           两个参数：【BuildContext、原始数据】
    ///           作用：【原始数据】转化成【转换后数据】的函数，返回【转换后数据】
    ///     3.shouldRebuild：
    ///           两个参数：【原始数据、转化后数据】
    ///           作用：是否重新build
    ///     4.builder：
    ///           三个参数：【BuildContext、转化后数据、child】
    return Selector<MealViewModel, List<MealDetailModel>>(
      selector: (context, mealVM) {
        return mealVM.mealList.where((meal) {
          return meal.categories.contains(mealCategoryModel.id);
        }).toList();
      },
      shouldRebuild: (prev, next) => !listEquals(prev, next),
      builder: (context, mealList, child) {
        if (mealList.length == 0) {
          return Center(
            child: Text(
              "无相关美食",
              style: TextStyle(
                fontSize: AppTheme.largeFontSize,
                color: Colors.black,
              ),
            ),
          );
        }
        return ListView.builder(
          itemCount: mealList.length,
          itemBuilder: (context, index) {
            return MealItem(mealList[index]);
          },
        );
      },
    );
  }
}
