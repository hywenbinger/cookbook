import 'package:cookbook/model/meal_detail_model.dart';
import 'package:cookbook/pages/detail/detail_page.dart';
import 'package:cookbook/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:cookbook/utils/screen/int_extension.dart';

/// 美食列表Item展示
///
/// 知识点：
///     1.Hero
///     2.Navigator.of(context).push()
///     3.PageRouteBuilder
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
                  buildItem(Icons.schedule, "${_model.duration}分钟"),
                  buildItem(Icons.restaurant, _model.complexityString),
                  buildItem(Icons.favorite, "未收藏"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row buildItem(IconData iconData, String operation) {
    return Row(
      children: [
        Icon(iconData),
        Text(operation),
      ],
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
