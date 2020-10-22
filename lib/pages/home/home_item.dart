import 'package:cookbook/model/category_item.dart';
import 'package:cookbook/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:cookbook/utils/screen/int_extension.dart';

class HomeItem extends StatelessWidget {
  final CategoryModel _model;

  HomeItem(this._model);

  @override
  Widget build(BuildContext context) {
    final bgColor = _model.color;
    return GestureDetector(
      onTap: () {
        print(_model.toString());
      },
      child: Card(
        /// 背景色
        color: bgColor,

        /// 阴影区域
        elevation: 20.px,

        /// 设置圆角
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20.px),
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
