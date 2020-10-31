import 'package:cookbook/model/meal_category_model.dart';
import 'package:cookbook/pages/home/home_item.dart';
import 'package:cookbook/theme/app_theme.dart';
import 'package:cookbook/utils/json_parse.dart';
import 'package:flutter/material.dart';
import 'package:cookbook/utils/screen/int_extension.dart';

/// 首页，展示美食分类
///
/// 知识点：
///     1.FutureBuilder
///     2.GridView
///     3.Json解析
///     4.Drawer
///     5.Builder/LayoutBuilder
class HomePage extends StatelessWidget {
  static const String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("美食广场"),
      ),
      body: HomeContent(),
      drawer: Drawer(
        child: DrawerContent(),
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// 使用FutureBuilder，方便获取异步数据，并构建Widget
    return FutureBuilder<List<MealCategoryModel>>(
      future: JsonParse.getMealCategoryData(),
      builder: (context, snapshot) {
        /// 请求数据中
        if (!snapshot.hasData) {
          // print("请求首页数据中......");
          return Center(child: CircularProgressIndicator());
        }

        /// 请求失败
        if (snapshot.error != null) {
          // print("请求首页数据失败");
          return Center(
            child: Text("请求失败"),
          );
        }

        /// 请求成功
        // print("请求首页数据完成");
        final models = snapshot.data;
        return GridView.builder(
          padding: EdgeInsets.all(20.px),
          itemCount: models.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20.px,
            mainAxisSpacing: 20.px,
            childAspectRatio: 1.5,
          ),
          itemBuilder: (context, index) {
            return HomeItem(models[index]);
          },
        );
      },
    );
  }
}

class DrawerContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildHeaderView(context),
        _buildListTile(
          context,
          Icon(Icons.restaurant),
          "进餐",
          () {
            ///关闭Drawer
            Navigator.of(context).pop();
          },
        ),
        _buildListTile(
          context,
          Icon(Icons.settings),
          "过滤",
          () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }

  Widget _buildHeaderView(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40.dpr,
      color: Colors.orange,
      // margin: EdgeInsets.only(bottom: 10.dpr),
      alignment: Alignment(0, 0.5),
      child: Text(
        "开始动手",
        style: TextStyle(
          fontSize: AppTheme.largeFontSize,
        ),
      ),
    );
  }

  Widget _buildListTile(
      BuildContext context, Widget icon, String title, Function handler) {
    return ListTile(
      leading: icon,
      title: Text(
        title,
        style: TextStyle(
          fontSize: AppTheme.normalFontSize,
        ),
      ),
      onTap: handler,
    );
  }
}
