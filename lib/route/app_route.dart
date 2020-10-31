import 'package:cookbook/pages/detail/detail_page.dart';
import 'package:cookbook/pages/filter/filter_page.dart';
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

  /// 钩子函数：onGenerateRoute
  ///     * 当我们通过pushNamed进行跳转，但是对应的name没有在routes中有映射关系，就会执行onGenerateRoute函数
  ///     * 可以在该函数中，手动创建对应的Route进行返回
  ///     * 该函数有一个参数RouteSettings，该类有两个常用的属性：
  ///         1.name: 跳转的路由名称
  ///         2.arguments：跳转时携带的参数
  static final RouteFactory generateRoute = (settings) {
    if (settings.name == FilterPage.routeName) {
      return MaterialPageRoute(
        builder: (context) {
          return FilterPage();
        },
      );
    }
    return null;
  };

  /// 未知路由函数：onUnknownRoute
  ///     * 打开的一个路由名称不存在的界面，并且onGenerateRoute函数中未处理返回null，就会执行onUnknownRoute函数
  ///     * 如果没有进行特殊的处理，那么Flutter会报错
  static final RouteFactory unknownRoute = (settings) {
    return null;
  };
}
