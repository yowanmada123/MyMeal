import 'package:mymeal/model/food_category_model.dart';
import 'package:mymeal/model/food_detail_model.dart';
import 'package:mymeal/model/food_list_model.dart';
import 'package:mymeal/resources/api_provider.dart';

class ApiRepository {
  final _provider = ApiProvider();

  Future<FoodCategoryModel> fetchCategoryList() {
    return _provider.fetchCategoryList();
  }

  Future<FoodListModel> fetchFoodList(String data) {
    return _provider.fetchFoodList(data);
  }

  Future<FoodDetailModel> fetchFoodDetail(String data) {
    return _provider.fetchFoodDetail(data);
  }
}
