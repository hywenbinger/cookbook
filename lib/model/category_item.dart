import 'package:flutter/material.dart';

class CategoryModel {
  String _id = "";
  String _title = "";
  String _colorString = "";
  Color _color;

  Color get color => _color;

  String get title => _title;

  String get id => _id;

  CategoryModel.fromJson(Map<String, dynamic> data) {
    _id = data['id'];
    _title = data['title'];
    _colorString = data['color'];
    // 1.将color转成十六进制的数字
    final colorInt = int.parse(_colorString, radix: 16);
    // 2.将透明度加进去
    _color = Color(colorInt | 0xFF000000);
  }

  @override
  String toString() {
    return 'CategoryModel{_id: $_id, _title: $_title, _color: $_color}';
  }
}
