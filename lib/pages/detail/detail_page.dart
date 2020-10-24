import 'package:cookbook/model/meal_detail_model.dart';
import 'package:flutter/material.dart';
import 'package:cookbook/utils/screen/int_extension.dart';

/// 美食详情页面
///
/// 知识点：
///     1.Hero动画的使用
class DetailPage extends StatelessWidget {
  static const String routeName = "/detail";

  final MealDetailModel _model;

  DetailPage(this._model);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_model.title),
      ),
      body: Column(
        children: [
          /// Hero动画的使用
          Hero(
            tag: _model.imageUrl,
            child: Image.network(
              _model.imageUrl,
              width: double.infinity,
              height: 100.dpr,
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );
  }
}
