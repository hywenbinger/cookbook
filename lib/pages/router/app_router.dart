import 'file:///D:/Work/Flutter/workspace/cookbook/lib/pages/favorite/favorite_page.dart';
import 'file:///D:/Work/Flutter/workspace/cookbook/lib/pages/home/home_page.dart';
import 'package:cookbook/pages/main_page.dart';
import 'package:flutter/material.dart';

class AppRouter {
  /// 默认启动页面对应的路由
  static final String initialRoute = MainPage.routeName;

  /// 路由名称和路由之间的对应关系
  static final Map<String, WidgetBuilder> routes = {
    MainPage.routeName: (context) => MainPage(),
    HomePage.routeName: (context) => HomePage(),
    FavoritePage.routeName: (context) => FavoritePage(),
  };

  static final RouteFactory generateRoute = (settings) {
    return null;
  };

  /// 未知页面的路由
  static final RouteFactory unknownRoute = (settings) {
    return null;
  };
}
