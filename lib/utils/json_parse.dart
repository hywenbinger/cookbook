import 'dart:convert';

import 'package:cookbook/model/category_item.dart';
import 'package:flutter/services.dart';

class JsonParse {
  static Future<List<CategoryModel>> getCategoryData() async {
    /// 1.加载json文件
    final String jsonString =
        await rootBundle.loadString("assets/json/category.json");

    /// 2.将jsonString转成Map
    final result = json.decode(jsonString);

    /// 3.将Map中的内容转成List
    final resultList = result["category"];

    /// 4.将List中的内容转成对象
    List<CategoryModel> list = [];
    for (var data in resultList) {
      final CategoryModel model = CategoryModel.fromJson(data);
      print(model.toString());
      list.add(model);
    }
    return list;
  }
}
