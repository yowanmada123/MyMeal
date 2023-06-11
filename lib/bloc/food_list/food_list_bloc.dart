import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mymeal/bloc/food_list/food_list_event.dart';
import 'package:mymeal/bloc/food_list/food_list_state.dart';
import 'package:mymeal/resources/api_repository.dart';

class FoodListBloc extends Bloc<FoodListEvent, FoodListState> {
  FoodListBloc() : super(FoodListInitial()) {
    final ApiRepository _apiRepository = ApiRepository();

    on<GetFoodList>((event, emit) async {
      try {
        // print("PRINT 1");
        emit(FoodListLoading());
        // print("PRINT 2");
        final foodListBloc = await _apiRepository.fetchFoodList(event.foodCategory);
        // print("PRINT 3");
        emit(FoodListLoaded(foodListBloc));
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
