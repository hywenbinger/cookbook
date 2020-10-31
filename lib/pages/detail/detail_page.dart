import 'package:cookbook/model/meal_detail_model.dart';
import 'package:cookbook/theme/app_theme.dart';
import 'package:cookbook/utils/screen/size_fit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cookbook/utils/screen/int_extension.dart';

/// 美食详情页面
///
/// 知识点：
///     1.Hero动画的使用
///     2.SingleChildScrollView
///     3.ListView
///     4.ScrollView、Column、ListView嵌套问题
///     5.MediaQuery.of(context).size
class DetailPage extends StatelessWidget {
  static const String routeName = "/detail";

  final MealDetailModel _model;

  DetailPage(this._model);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_model.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildImage(),
            _buildTitle("制作食材"),
            _buildMaterial(context),
            _buildTitle("制作步骤"),
            _buildProcess(context),
            SizedBox(
              height: 5.dpr,
            )
          ],
        ),
      ),
    );
  }

  /// 横幅图片
  Widget _buildImage() {
    return Hero(
      tag: _model.imageUrl,
      child: Image.network(
        _model.imageUrl,
        width: double.infinity,
        height: 100.dpr,
        fit: BoxFit.cover,
      ),
    );
  }

  /// 制作食材
  Widget _buildMaterial(BuildContext context) {
    return _buildListView(
      context,
      _model.ingredients,
      (context, index) {
        return _buildMaterialItem(_model.steps[index]);
      },
    );
  }

  /// 制作食材的Item
  Widget _buildMaterialItem(String content) {
    return Card(
      color: Colors.yellow,
      child: Padding(
        padding: EdgeInsets.all(3.dpr),
        child: Text(
          content,
          style: TextStyle(
            fontSize: AppTheme.smallFontSize,
          ),
        ),
      ),
    );
  }

  /// 制作步骤
  Widget _buildProcess(BuildContext context) {
    return _buildListView(
      context,
      _model.steps,
      (context, index) {
        return _buildProcessItem(index, _model.steps[index]);
      },
    );
  }

  /// 制作步骤的Item
  Widget _buildProcessItem(int index, String content) {
    return Padding(
      padding: EdgeInsets.fromLTRB(4.dpr, 3.dpr, 4.dpr, 3.dpr),
      child: Row(
        children: [
          CircleAvatar(
            child: Text(
              "#$index",
            ),
          ),
          SizedBox(
            width: 5.dpr,
          ),
          Container(
            child: Text(
              content+"222222222222222222222222222222222222222222222222222",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: AppTheme.smallFontSize,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitle(String title) {
    return Padding(
      padding: EdgeInsets.all(3.dpr),
      child: Text(
        title,
        style: TextStyle(
          fontSize: AppTheme.largeFontSize,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _buildListView(BuildContext context, List<String> content,
      IndexedWidgetBuilder itemWidgetBuilder) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(3.dpr),
      ),
      width: MediaQuery.of(context).size.width - 10.dpr,
      child: ListView.builder(
        /// shrinkWrap：控制ListView按内容固定高度
        shrinkWrap: true,

        /// physics：控制ListView滚动
        physics: NeverScrollableScrollPhysics(),

        /// padding：设置ListView的内边距
        padding: EdgeInsets.all(3.dpr),
        itemBuilder: itemWidgetBuilder,
        itemCount: content.length,
      ),
    );
  }
}
