import 'package:cookbook/pages/list/list_page.dart';
import 'package:cookbook/pages/main_page.dart';
import 'package:flutter/material.dart';

/// 路由管理
///
/// 知识点：
///     1.路由
class AppRoute {
  /// 默认启动页面对应的路由
  static final String initialRoute = MainPage.routeName;

  /// 路由名称和路由之间的对应关系
  static final Map<String, WidgetBuilder> routes = {
    MainPage.routeName: (context) => MainPage(),
    ListPage.routeName: (context) => ListPage(),
  };

  static final RouteFactory generateRoute = (settings) {
    return null;
  };

  /// 未知页面的路由
  static final RouteFactory unknownRoute = (settings) {
    return null;
  };
}
