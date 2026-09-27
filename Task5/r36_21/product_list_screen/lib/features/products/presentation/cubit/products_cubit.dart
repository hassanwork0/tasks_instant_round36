import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_list_screen/features/products/data/dummy_data.dart';
import 'package:product_list_screen/features/products/data/product.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitial());
  Future<void> getProducts() async {
    emit(ProductsLoadingState());

    await Future.delayed(const Duration(milliseconds: 1000));

    final int prodcutsCase = Random().nextInt(3);

    // Failure => error message
    // Loaded => but List is empty => size = 0
    // Loaded => size = 6
    if (prodcutsCase == 0) {
      emit(ProductsFailureState(errorMessage: 'Loading failed!'));
    }

    if (prodcutsCase == 1) {
      emit(ProductsLoadedState(products: []));
    }

    if (prodcutsCase == 2) {
      emit(ProductsLoadedState(products: products)); // Assumes a global 'products' list exists from dummy_data.dart
    }
  }
}
