import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:mymeal/model/food_category_model.dart';
import 'package:mymeal/model/food_detail_model.dart';
import 'package:mymeal/model/food_list_model.dart';

class ApiProvider {
  final Dio _dio = Dio();
  final String _url = 'https://www.themealdb.com/api/json/v1/1/';

  Future<FoodCategoryModel> fetchCategoryList() async {
    try {
      print("HAHAHA");
      Response response = await _dio.get('${_url}list.php?c=list');
      print(response);
      return FoodCategoryModel.fromJson(response.data);
    } catch (error, stacktrace) {
      if (kDebugMode) {
        print("Exception occuredL $error stacktrace: $stacktrace");
      }
      throw Exception('Error from Exception');
    }
  }

  Future<FoodListModel> fetchFoodList(String data) async {
    try {
      print("HAHAHA");
      Response response = await _dio.get('${_url}filter.php?c=$data');
      print(response);
      return FoodListModel.fromJson(response.data);
    } catch (error, stacktrace) {
      if (kDebugMode) {
        print("Exception occuredL $error stacktrace: $stacktrace");
      }
      throw Exception('Error from Exception');
    }
  }

  Future<FoodDetailModel> fetchFoodDetail(String data) async {
    try {
      print("HAHAHA");
      Response response = await _dio.get('${_url}lookup.php?i=$data');
      print(response);
      return FoodDetailModel.fromJson(response.data);
    } catch (error, stacktrace) {
      if (kDebugMode) {
        print("Exception occuredL $error stacktrace: $stacktrace");
      }
      throw Exception('Error from Exception');
    }
  }
}
