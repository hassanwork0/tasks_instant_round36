import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_list_4_stages/features/products/data/dummy_data.dart';
import 'package:product_list_4_stages/features/products/data/product.dart';


part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitialState());

  Future<void> getProducts() async {
    emit(ProductsLoadingState());

    await Future.delayed(Duration(milliseconds: 1500));

    final int productsCase = Random().nextInt(3);

    if (productsCase == 0) {
      emit(ProductFailureState(errorMessage: "loading failed"));
    }
    if (productsCase == 1) {
      emit(ProductsLoadedState( products : []));
    }
    if (productsCase == 2) {
      emit(ProductsLoadedState(products: products));
    }
  }
}
