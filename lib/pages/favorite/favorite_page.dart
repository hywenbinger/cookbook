import 'package:flutter/material.dart';

/// 收藏页面
class FavoritePage extends StatefulWidget {
  static const String routeName = "/main/favorite";

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我的收藏"),
      ),
    );
  }
}
