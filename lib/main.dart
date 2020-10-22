import 'package:cookbook/pages/router/app_router.dart';
import 'package:cookbook/theme/app_theme.dart';
import 'package:cookbook/utils/screen/size_fit.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

/// 启动入口
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
      routes: AppRouter.routes,
      initialRoute: AppRouter.initialRoute,
      onGenerateRoute: AppRouter.generateRoute,
      onUnknownRoute: AppRouter.unknownRoute,
    );
  }
}
