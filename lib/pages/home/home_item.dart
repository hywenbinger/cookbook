import 'package:cookbook/model/meal_category_model.dart';
import 'package:cookbook/pages/list/list_page.dart';
import 'package:flutter/material.dart';
import 'package:cookbook/utils/screen/int_extension.dart';

/// 首页Item
///
/// 知识点：
///     1.GestureDetector
///     2.Card
///     3.Navigator.of(context).pushNamed()
///     4.Theme.of(context)
class HomeItem extends StatelessWidget {
  final MealCategoryModel _model;

  HomeItem(this._model);

  @override
  Widget build(BuildContext context) {
    final bgColor = _model.color;
    return GestureDetector(
      onTap: () {
        print("点击了-->${_model.toString()}");

        /// 跳转到【美食列表页面】
        Navigator.of(context).pushNamed(ListPage.routeName, arguments: _model);
      },
      child: Card(
        /// 背景色
        color: bgColor,

        /// 阴影区域
        elevation: 2.dpr,

        /// 设置圆角
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5.dpr),
          ),
        ),
        child: Center(
          child: Text(
            _model.title,
            style: Theme.of(context).textTheme.bodyText1.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ),
    );
  }
}
