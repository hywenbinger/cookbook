import 'package:flutter/material.dart';

class AppTheme {
  // 公用属性
  static const double smallFontSize = 16;
  static const double normalFontSize = 20;
  static const double largeFontSize = 24;

  // 默认主题
  static const Color lightTextColor = Colors.red;
  static const Color lightBgColor = Color.fromARGB(255, 255, 254, 200);

  static final ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.pink,

    /// 画布颜色
    canvasColor: lightBgColor,

    /// 文本主题
    textTheme: TextTheme(
      bodyText1: TextStyle(
        color: Colors.black87,
        fontSize: smallFontSize,
      ),
    ),
  );

  // 暗黑主题
  static const Color darkTextColor = Colors.black12;

  static final ThemeData darkTheme = ThemeData(
    primarySwatch: Colors.grey,
    textTheme: TextTheme(
      bodyText2: TextStyle(
        color: darkTextColor,
        fontSize: smallFontSize,
      ),
    ),
  );
}
