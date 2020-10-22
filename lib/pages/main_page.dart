import 'file:///D:/Work/Flutter/workspace/cookbook/lib/pages/favorite/favorite_page.dart';
import 'package:cookbook/theme/app_theme.dart';
import 'package:flutter/material.dart';

import 'home/home_page.dart';

class MainPage extends StatefulWidget {
  static const String routeName = "/main";

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: <Widget>[
          HomePage(),
          FavoritePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          _createItem("首页", Icons.home),
          _createItem("收藏", Icons.favorite),
        ],
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        unselectedFontSize: AppTheme.smallFontSize,
        selectedFontSize: AppTheme.smallFontSize,
        backgroundColor: Colors.white60,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

  BottomNavigationBarItem _createItem(String label, IconData iconData) {
    return BottomNavigationBarItem(
      label: label,
      icon: Icon(
        iconData,
      ),
    );
  }
}
