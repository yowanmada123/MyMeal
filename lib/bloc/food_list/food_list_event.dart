import 'package:equatable/equatable.dart';

abstract class FoodListEvent extends Equatable {
  const FoodListEvent();

  List<Object> get props => [];
}

class GetFoodList extends FoodListEvent {
  final foodCategory;

  GetFoodList(this.foodCategory);
}
