import 'package:cookbook/model/meal_detail_model.dart';
import 'package:cookbook/model/meal_list_model.dart';
import 'package:cookbook/utils/http/http_config.dart';
import 'package:cookbook/utils/http/http_request.dart';

class MealRequest {
  static const _API = "/meal";

  static Future<List<MealDetailModel>> getMealListData() async {
    final url = HTTPConfig.BASE_URL + _API;
    print("开始网络请求-->$url");
    final json = await HttpRequest.request(url);
    print("结束网络请求-->$url");
    return MealListModel.fromJson(json).meal;
  }
}
