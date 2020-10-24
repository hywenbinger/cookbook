import 'meal_detail_model.dart';

/// 【美食列表】的数据模型
class MealListModel {
  List<MealDetailModel> meal;

  MealListModel({this.meal});

  factory MealListModel.fromJson(Map<String, dynamic> json) {
    return MealListModel(
      meal: json['meal'] != null
          ? (json['meal'] as List).map((i) => MealDetailModel.fromJson(i)).toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.meal != null) {
      data['meal'] = this.meal.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
