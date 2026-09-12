import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/dummy_data.dart';
import 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitialState());

  Future<void> getProducts() async {
    emit(ProductsLoadedState(dummyProducts));
    await Future<void>.delayed(Duration(milliseconds: 1500));

    final int caseIndex = Random().nextInt(3);

    switch (caseIndex) {
      case 0:
        emit(ProductsLoadedState(dummyProducts));
        break;
      case 1:
        emit(ProductsLoadedState([]));
        break;
      default:
        emit(ProductsFailureState());
    }
  }
}
