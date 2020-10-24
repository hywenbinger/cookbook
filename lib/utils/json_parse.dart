import 'dart:convert';

import 'package:cookbook/model/home_item_model.dart';
import 'package:flutter/services.dart';

/// Json解析工具类
///
/// 知识点：
///   1.Future
///   2.rootBundle.loadString()
///   3.json.decode()
class JsonParse {
  /// 解析首页数据
  static Future<List<HomeItemModel>> getHomeData() async {
    /// 1.加载json文件
    final String jsonString = await Future.delayed(Duration(seconds: 2), () {
      return rootBundle.loadString("assets/json/category.json");
    });

    /// 2.将jsonString转成Map
    final result = json.decode(jsonString);

    /// 3.将Map中的内容转成List
    final resultList = result["category"];

    /// 4.将List中的内容转成对象
    List<HomeItemModel> list = [];
    for (var data in resultList) {
      final HomeItemModel model = HomeItemModel.fromJson(data);
      print(model.toString());
      list.add(model);
    }
    return list;
  }
}
