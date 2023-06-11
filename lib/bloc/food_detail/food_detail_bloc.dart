import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mymeal/bloc/food_detail/food_detail_event.dart';
import 'package:mymeal/bloc/food_detail/food_detail_state.dart';
import 'package:mymeal/bloc/food_list/food_list_event.dart';
import 'package:mymeal/bloc/food_list/food_list_state.dart';
import 'package:mymeal/resources/api_repository.dart';

class FoodDetailBloc extends Bloc<FoodDetailEvent, FoodDetailState> {
  FoodDetailBloc() : super(FoodDetailInitial()) {
    final ApiRepository _apiRepository = ApiRepository();

    on<GetFoodDetail>((event, emit) async {
      try {
        // print("PRINT 1");
        emit(FoodDetailLoading());
        // print("PRINT 2");
        final foodDetailBloc = await _apiRepository.fetchFoodDetail(event.food);
        // print("PRINT 3");
        emit(FoodDetailLoaded(foodDetailBloc));
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
