import 'package:flutter/foundation.dart';

import '../../data/product.dart';

@immutable
abstract class ProductsState {}

class ProductsInitialState extends ProductsState {}

class ProductsLoadingState extends ProductsState {}

class ProductsLoadedState extends ProductsState {
  final List<Product> products;

  ProductsLoadedState(this.products);
}

class ProductsFailureState extends ProductsState {}
