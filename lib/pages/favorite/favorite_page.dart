import 'package:cookbook/theme/app_theme.dart';
import 'package:cookbook/viewmodel/favor_view_model.dart';
import 'package:cookbook/widgets/meal_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// 收藏页面
class FavoritePage extends StatelessWidget {
  static const String routeName = "/favorite";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我的收藏"),
      ),
      body: FavoriteContent(),
    );
  }
}

class FavoriteContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<FavorViewModel>(
      builder: (context, viewModel, child) {
        if (viewModel.mealList.length == 0) {
          return Center(
            child: Text(
              "未收藏美食",
              style: TextStyle(
                fontSize: AppTheme.largeFontSize,
                color: Colors.black,
              ),
            ),
          );
        }
        return ListView.builder(
          itemCount: viewModel.mealList.length,
          itemBuilder: (context, index) {
            return MealItem(viewModel.mealList[index]);
          },
        );
      },
    );
  }
}
