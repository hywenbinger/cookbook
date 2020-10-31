import 'package:cookbook/theme/app_theme.dart';
import 'package:cookbook/viewmodel/filter_view_model.dart';
import 'package:flutter/material.dart';
import 'package:cookbook/utils/screen/int_extension.dart';
import 'package:provider/provider.dart';

/// 过滤界面
///
/// 知识点：
///     1.ListView
///     2.Expanded
///     3.ListTile
class FilterPage extends StatelessWidget {
  static const String routeName = "/filter";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("美食过滤"),
      ),
      body: FilterContent(),
    );
  }
}

class FilterContent extends StatefulWidget {
  @override
  _FilterContentState createState() => _FilterContentState();
}

class _FilterContentState extends State<FilterContent> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          _buildTitle("请做出你的选择"),
          _buildListView(),
        ],
      ),
    );
  }

  Widget _buildTitle(String title) {
    return Padding(
      padding: EdgeInsets.all(6.dpr),
      child: Text(
        title,
        style: TextStyle(
          fontSize: AppTheme.largeFontSize,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _buildListView() {
    /// 使用【Expanded】后，ListView会占据【Column】的剩余空间
    return Expanded(
      child: Consumer<FilterViewModel>(
        builder: (context, viewModel, child) {
          return ListView(
            children: [
              _buildListItem(
                "无谷蛋白",
                "是否过滤包含无谷蛋白的食物",
                viewModel.isGlutenFree,
                (value) {
                  viewModel.isGlutenFree = value;
                },
              ),
              _buildListItem(
                "不含乳糖",
                "是否过滤不含乳糖的食物",
                viewModel.isLactoseFree,
                (value) {
                  viewModel.isLactoseFree = value;
                },
              ),
              _buildListItem(
                "普通素食者",
                "是否按普通素食者的要求过滤",
                viewModel.isVegetarian,
                (value) {
                  viewModel.isVegetarian = value;
                },
              ),
              _buildListItem(
                "严格素食者",
                "是否按严格素食者的要求过滤",
                viewModel.isVegan,
                (value) {
                  viewModel.isVegan = value;
                },
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildListItem(
      String title, String subTitle, bool value, ValueChanged<bool> onChange) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(fontSize: AppTheme.normalFontSize),
      ),
      subtitle: Text(subTitle),
      trailing: Switch(
        value: value,
        onChanged: onChange,
      ),
    );
  }
}
