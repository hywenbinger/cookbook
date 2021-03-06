import 'package:cookbook/route/app_route.dart';
import 'package:cookbook/theme/app_theme.dart';
import 'package:cookbook/utils/screen/size_fit.dart';
import 'package:cookbook/viewmodel/favor_view_model.dart';
import 'package:cookbook/viewmodel/filter_view_model.dart';
import 'package:cookbook/viewmodel/meal_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// 启动入口
///
/// 知识点：
///     1.主题设置
///     2.路由设置
///     3.Provider共享数据
///     4.MultiProvider
///     5.ChangeNotifierProvider(懒加载)
///     6.ChangeNotifierProxyProvider
void main() {
  runApp(MultiProvider(
    child: MyApp(),
    providers: [
      /// TODO：FilterViewModel声明在MealViewModel后，打开列表界面会报错
      ChangeNotifierProvider(
        create: (context) => FilterViewModel(),
      ),

      /// 使两个 ViewModel 产生依赖
      ChangeNotifierProxyProvider<FilterViewModel, MealViewModel>(
        create: (context) => MealViewModel(),
        update: (context, filterVM, mealVM) {
          mealVM.updateFilterViewModel(filterVM);
          return mealVM;
        },
      ),
      ChangeNotifierProvider(
        create: (context) => FavorViewModel(),
      ),
    ],
  ));
}

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
