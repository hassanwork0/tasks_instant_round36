part of 'products_cubit.dart';

abstract class ProductsState {}

class ProductsInitial extends ProductsState {}
final class ProductsLoadingState extends ProductsState {}

final class ProductsLoadedState extends ProductsState {
  final List<Product> products;
  ProductsLoadedState({required this.products});
}

final class ProductsFailureState extends ProductsState {
  final String errorMessage;
  ProductsFailureState({required this.errorMessage});
}