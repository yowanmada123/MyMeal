import 'package:equatable/equatable.dart';
import 'package:mymeal/model/food_category_model.dart';

abstract class FoodCategoryState extends Equatable {
  const FoodCategoryState();

  List<Object> get props => [];
}

class FoodCategoryInitial extends FoodCategoryState {}

class FoodCategoryLoading extends FoodCategoryState {}

class FoodCategoryLoaded extends FoodCategoryState {
  final FoodCategoryModel foodCategory;
  const FoodCategoryLoaded(this.foodCategory);
}

class FoodCategoryError extends FoodCategoryState {
  final String? message;
  const FoodCategoryError(this.message);
}
