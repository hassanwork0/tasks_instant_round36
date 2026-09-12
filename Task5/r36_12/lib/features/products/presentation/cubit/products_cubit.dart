import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_products/features/products/data/repo/products_repo.dart';

import '../../data/dummy.dart';
import '../../data/models/products_model.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final ProductsRepo _productsRepo;
  ProductsCubit(this._productsRepo) : super(ProductsInitialState());

  Future<void> getProducts() async {
    emit(ProductsLoadingState());

    await Future.delayed(const Duration(milliseconds: 5000));

    final int productsCase = Random().nextInt(3);

    final productsModel = await _productsRepo.getProducts();

    if (productsCase == 0) {
      emit(ProductsFailureState(errorMessage: 'Loading failed!'));
    }

    if (productsCase == 1) {
      emit(ProductsLoadedState(products: []));
    }

    if (productsCase == 2) {
      emit(ProductsLoadedState(products: productsModel.products!));
    }
  }
}
