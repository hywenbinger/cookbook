import 'package:cookbook/model/meal_detail_model.dart';
import 'package:cookbook/pages/detail/detail_page.dart';
import 'package:cookbook/theme/app_theme.dart';
import 'package:cookbook/viewmodel/favor_view_model.dart';
import 'package:flutter/material.dart';
import 'package:cookbook/utils/screen/int_extension.dart';
import 'package:provider/provider.dart';

/// 美食列表Item展示
///
/// 知识点：
///     1.Hero
///     2.Navigator.of(context).push()
///     3.PageRouteBuilder
///     4.Stack
class MealItem extends StatelessWidget {
  final MealDetailModel _model;

  MealItem(this._model);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _jumpDetailPage(context);
      },
      child: Card(
        margin: EdgeInsets.all(5.dpr),
        elevation: 2.dpr,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5.dpr),
          ),
        ),
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                _buildImage(),
                _buildTitle(),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(5.dpr),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildItem(Icons.schedule, "${_model.duration}分钟"),
                  _buildItem(Icons.restaurant, _model.complexityString),
                  _buildFavorItem(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row _buildItem(IconData iconData, String operation) {
    return Row(
      children: [
        Icon(iconData),
        Text(operation),
      ],
    );
  }

  /// 使用Consumer获取收藏列表共享数据
  Widget _buildFavorItem() {
    return Consumer<FavorViewModel>(
      builder: (context, viewModel, child) {
        /// 1.判断是否是收藏状态
        final isFavor = viewModel.isFavor(_model);

        /// 2.设置不同的图标
        final iconData = isFavor ? Icons.favorite : Icons.favorite_border;

        /// 3.设置图标的颜色
        final iconColor = isFavor ? Colors.red : Colors.black;

        /// 4.设置不同文本
        final msg = isFavor ? "已收藏" : "未收藏";
        return GestureDetector(
          onTap: () {
            viewModel.handle(_model);
          },
          child: Row(
            children: [
              Icon(
                iconData,
                color: iconColor,
              ),
              Text(msg),
            ],
          ),
        );
      },
    );
  }

  Container _buildTitle() {
    return Container(
      padding: EdgeInsets.all(3.dpr),
      child: Text(
        _model.title,
        style: TextStyle(
          color: Colors.white,
          fontSize: AppTheme.largeFontSize,
        ),
      ),
      width: double.infinity,
      color: Colors.black54,
    );
  }

  ClipRRect _buildImage() {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(5.dpr),
      ),

      /// Hero动画的使用
      child: Hero(
        tag: _model.imageUrl,
        child: Image.network(
          _model.imageUrl,
          width: double.infinity,
          height: 85.dpr,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  void _jumpDetailPage(BuildContext context) {
    print("点击了-->${_model.title}");

    /// 跳转到【美食详情页面】
    Navigator.of(context).push(PageRouteBuilder(
      transitionDuration: Duration(
        milliseconds: 500,
      ),
      pageBuilder: (context, animation1, animation2) {
        return FadeTransition(
          opacity: animation1,
          child: DetailPage(_model),
        );
      },
    ));
  }
}
