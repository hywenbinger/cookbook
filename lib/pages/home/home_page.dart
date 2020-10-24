import 'package:cookbook/model/home_item_model.dart';
import 'package:cookbook/pages/home/home_item.dart';
import 'package:cookbook/utils/json_parse.dart';
import 'package:flutter/material.dart';
import 'package:cookbook/utils/screen/int_extension.dart';

/// 首页
class HomePage extends StatefulWidget {
  static const String routeName = "/main/home";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("美食广场"),
      ),
      body: HomeContent(),
    );
  }
}

/// 首页的内容
///
/// 知识点：
///     1.FutureBuilder
///     2.GridView
///     3.Json解析
class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<HomeItemModel>>(
      future: JsonParse.getHomeData(),
      builder: (context, snapshot) {
        /// 请求数据中
        if (!snapshot.hasData) {
          print("请求中......");
          return Center(child: CircularProgressIndicator());
        }

        /// 请求失败
        if (snapshot.error != null) {
          print("请求失败");
          return Center(
            child: Text("请求失败"),
          );
        }

        /// 请求成功
        print("请求完成");
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
