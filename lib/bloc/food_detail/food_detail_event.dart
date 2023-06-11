import 'package:equatable/equatable.dart';

abstract class FoodDetailEvent extends Equatable {
  const FoodDetailEvent();

  List<Object> get props => [];
}

class GetFoodDetail extends FoodDetailEvent {
  final food;

  GetFoodDetail(this.food);
}
