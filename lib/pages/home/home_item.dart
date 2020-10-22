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
    return Container(
      decoration: BoxDecoration(
        /// 背景色
        color: bgColor,

        /// 圆角
        borderRadius: BorderRadius.circular(20.px),

        /// 渐变
        gradient: LinearGradient(colors: [
          bgColor.withOpacity(.5),
          bgColor,
        ]),
      ),
      alignment: Alignment.center,
      child: Text(
        _model.title,
        style: Theme.of(context).textTheme.bodyText1.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: AppTheme.largeFontSize,
            ),
      ),
    );
  }
}
