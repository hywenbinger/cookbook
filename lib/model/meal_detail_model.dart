List<String> complexities = ["简单", "中等", "复杂"];

/// 【美食详情】的数据模型
class MealDetailModel {
  int affordability;
  List<String> categories;
  int complexity;
  String complexityString;
  int duration;
  String id;
  String imageUrl;
  List<String> ingredients;
  bool isGlutenFree;
  bool isLactoseFree;
  bool isVegan;
  bool isVegetarian;
  List<String> steps;
  String title;

  MealDetailModel(
      {this.affordability,
      this.categories,
      this.complexity,
      this.complexityString,
      this.duration,
      this.id,
      this.imageUrl,
      this.ingredients,
      this.isGlutenFree,
      this.isLactoseFree,
      this.isVegan,
      this.isVegetarian,
      this.steps,
      this.title});

  factory MealDetailModel.fromJson(Map<String, dynamic> json) {
    return MealDetailModel(
      affordability: json['affordability'],
      categories: json['categories'] != null
          ? new List<String>.from(json['categories'])
          : null,
      complexity: json['complexity'],
      complexityString: complexities[json['complexity']],
      duration: json['duration'],
      id: json['id'],
      imageUrl: json['imageUrl'],
      ingredients: json['ingredients'] != null
          ? new List<String>.from(json['ingredients'])
          : null,
      isGlutenFree: json['isGlutenFree'],
      isLactoseFree: json['isLactoseFree'],
      isVegan: json['isVegan'],
      isVegetarian: json['isVegetarian'],
      steps:
          json['steps'] != null ? new List<String>.from(json['steps']) : null,
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['affordability'] = this.affordability;
    data['complexity'] = this.complexity;
    data['duration'] = this.duration;
    data['id'] = this.id;
    data['imageUrl'] = this.imageUrl;
    data['isGlutenFree'] = this.isGlutenFree;
    data['isLactoseFree'] = this.isLactoseFree;
    data['isVegan'] = this.isVegan;
    data['isVegetarian'] = this.isVegetarian;
    data['title'] = this.title;
    if (this.categories != null) {
      data['categories'] = this.categories;
    }
    if (this.ingredients != null) {
      data['ingredients'] = this.ingredients;
    }
    if (this.steps != null) {
      data['steps'] = this.steps;
    }
    return data;
  }
}
