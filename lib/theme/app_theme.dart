import 'package:flutter/material.dart';
import 'package:cookbook/utils/screen/double_extension.dart';

/// 主题管理
class AppTheme {
  /// 公用属性
  static const double smallFontSize = 16;
  static const double normalFontSize = 20;
  static const double largeFontSize = 24;

  /// 默认主题
  static const Color lightTextColor = Colors.red;
  static const Color lightBgColor = Color.fromARGB(255, 255, 254, 200);

  static final ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.pink,
    canvasColor: lightBgColor,
    textTheme: TextTheme(
      bodyText1: TextStyle(
        color: Colors.black87,
        fontSize: largeFontSize,
      ),
    ),
  );

  /// 暗黑主题
  static const Color darkTextColor = Colors.white;
  static const Color darkBgColor = Colors.black12;

  static final ThemeData darkTheme = ThemeData(
    primarySwatch: Colors.blueGrey,
    canvasColor: darkBgColor,
    textTheme: TextTheme(
      bodyText2: TextStyle(
        color: darkTextColor,
        fontSize: largeFontSize,
      ),
    ),
  );
}
