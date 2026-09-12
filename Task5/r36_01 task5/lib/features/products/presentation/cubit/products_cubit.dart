import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_5/features/products/data/product.dart';
import '../../data/dummy_data.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitialState());

  Future<void> getProducts() async {
    emit(ProductsLoadingState());

    await Future.delayed(const Duration(milliseconds: 1500));

    final int prodcutsCase = Random().nextInt(3);

    if (prodcutsCase == 0) {
      emit(ProductsFailureState(errorMessage: 'Loading failed!'));
    }

    if (prodcutsCase == 1) {
      emit(ProductsLoadedState(products: []));
    }

    if (prodcutsCase == 2) {
      emit(ProductsLoadedState(products: products));
    }
  }
}