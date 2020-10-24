import 'package:cookbook/route/app_route.dart';
import 'package:cookbook/theme/app_theme.dart';
import 'package:cookbook/utils/screen/size_fit.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

/// 启动入口
///
/// 知识点：
///     1.主题设置
///     2.路由设置
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// 初始化屏幕信息
    SizeFit.initialize();

    return MaterialApp(
      debugShowCheckedModeBanner: false,

      /// 主题
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,

      /// 路由
      routes: AppRoute.routes,
      initialRoute: AppRoute.initialRoute,
      onGenerateRoute: AppRoute.generateRoute,
      onUnknownRoute: AppRoute.unknownRoute,
    );
  }
}
