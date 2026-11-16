import 'package:burger_store_ui/features/food/data/model/product_model.dart';
import 'package:burger_store_ui/features/food_details/presentation/bloc/price_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PriceCubit extends Cubit<PriceState> {
  PriceCubit(this.product) : super(PriceInitState(product.price));
  Product product;
  void increment() {
    emit(
      PriceState(
        counter: state.counter + 1,
        totalPrice: product.price * (state.counter + 1),
      ),
    );
  }

  void decrement() {
    if (state.counter > 1) {
      emit(
        PriceState(
          counter: state.counter - 1,
          totalPrice: product.price * (state.counter - 1),
        ),
      );
    }
  }
}
