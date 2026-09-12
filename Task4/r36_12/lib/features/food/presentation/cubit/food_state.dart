part of 'food_cubit.dart';

class FoodState {
  final int counter;
  final double price;
  final double spicyValue;

  const FoodState({
    required this.counter,
    required this.price,
    required this.spicyValue,
  });
}

final class FoodInitialState extends FoodState {
  FoodInitialState() : super(counter: 0, price: 0, spicyValue: 0.0);
}


