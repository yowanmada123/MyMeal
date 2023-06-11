import 'package:equatable/equatable.dart';

abstract class FoodCategoryEvent extends Equatable {
  const FoodCategoryEvent();
  
  List<Object> get props => [];
}

 class GetFoodCategoryList extends FoodCategoryEvent {
  
 }