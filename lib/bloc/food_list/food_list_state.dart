import 'package:equatable/equatable.dart';
import 'package:mymeal/model/food_category_model.dart';
import 'package:mymeal/model/food_list_model.dart';

abstract class FoodListState extends Equatable {
  const FoodListState();

  List<Object> get props => [];
}

class FoodListInitial extends FoodListState {}

class FoodListLoading extends FoodListState {}

class FoodListLoaded extends FoodListState {
  final FoodListModel foodList;
  const FoodListLoaded(this.foodList);
}

class FoodListError extends FoodListState {
  final String? message;
  const FoodListError(this.message);
}
