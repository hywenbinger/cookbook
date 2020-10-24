import 'package:cookbook/model/home_item_model.dart';
import 'package:flutter/material.dart';

/// 不同分类菜谱列表页
///
/// 知识点：
///     1.ModalRoute.of(context)
class MealPage extends StatelessWidget {
  static const String routeName = "/meal";

  @override
  Widget build(BuildContext context) {
    /// 获取从【HomePage】传递过来的数据
    final homeItemModel =
        ModalRoute.of(context).settings.arguments as HomeItemModel;
    print("MealPage-->${homeItemModel.toString()}");
    return Scaffold(
      appBar: AppBar(
        title: Text(
          homeItemModel.title,
        ),
      ),
    );
  }
}
