import 'package:flutter_bloc/flutter_bloc.dart';

part 'food_state.dart';

class FoodCubit extends Cubit<FoodState> {
  final double originalPrice;
  FoodCubit({required this.originalPrice}) : super(FoodInitialState());

  void increment() {
    final inc = state.counter + 1;
    emit(FoodState(counter: inc, price: originalPrice * inc, spicyValue: 0));
  }

  void decrement() {
    if (state.counter < 1) return;

    final dec = state.counter - 1;
    emit(FoodState(counter: dec, price: originalPrice * dec, spicyValue: 0));
  }

  void changeSpicy(double value) {
    emit(
      FoodState(counter: state.counter, price: state.price, spicyValue: value),
    );
  }
}
