import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mymeal/resources/api_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:mymeal/model/food_category_model.dart';
import 'package:bloc/bloc.dart';

import 'food_category_event.dart';
import 'food_category_state.dart';

class FoodCategoryBloc extends Bloc<FoodCategoryEvent, FoodCategoryState> {
  FoodCategoryBloc() : super(FoodCategoryInitial()) {
    final ApiRepository _apiRepository = ApiRepository();

    on<GetFoodCategoryList>((event, emit) async {
      try {
        // print("PRINT 1");
        emit(FoodCategoryLoading());
        // print("PRINT 2");
        final foodCategoryList = await _apiRepository.fetchCategoryList();
        // print("PRINT 3");
        emit(FoodCategoryLoaded(foodCategoryList));
        // print("PRINT 4");
        // if(foodCategoryList.error != null){
        //       emit(FoodCategoryError("Error Catch Data"));
        // }
      } catch (e) {
        throw Exception('Error from Exception');
      }
      // on Networkerror{

      // }
    });
  }
}
