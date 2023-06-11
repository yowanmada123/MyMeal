import 'package:equatable/equatable.dart';
import 'package:mymeal/model/food_category_model.dart';
import 'package:mymeal/model/food_detail_model.dart';
import 'package:mymeal/model/food_list_model.dart';

abstract class FoodDetailState extends Equatable {
  const FoodDetailState();

  List<Object> get props => [];
}

class FoodDetailInitial extends FoodDetailState {}

class FoodDetailLoading extends FoodDetailState {}

class FoodDetailLoaded extends FoodDetailState {
  final FoodDetailModel foodList;
  const FoodDetailLoaded(this.foodList);
}

class FoodListError extends FoodDetailState {
  final String? message;
  const FoodListError(this.message);
}
