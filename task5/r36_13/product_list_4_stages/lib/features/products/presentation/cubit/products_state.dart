part of 'products_cubit.dart';

sealed class ProductsState {}

final class ProductsInitialState extends ProductsState {}

final class ProductsLoadingState extends ProductsState {}

final class ProductsLoadedState extends ProductsState {
  final List<Product> products;

  ProductsLoadedState({required this.products});
}

final class ProductFailureState extends ProductsState {
  final String errorMessage;
  ProductFailureState({required this.errorMessage});
}
