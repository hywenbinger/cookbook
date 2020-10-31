import 'package:cookbook/pages/filter/filter_page.dart';
import 'package:cookbook/theme/app_theme.dart';
import 'package:cookbook/utils/screen/int_extension.dart';
import 'package:flutter/material.dart';

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
            ///跳转到【美食过滤界面】
            Navigator.of(context).pushNamed(FilterPage.routeName);
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
