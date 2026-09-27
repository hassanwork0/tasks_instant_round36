part of 'products_details_cubit.dart';

sealed class ProductsDetailsState {}

final class ProductsDetailsInitialState extends ProductsDetailsState {}

final class ProductsDetailsLoadingState extends ProductsDetailsState {}

final class ProductsDetailsSuccessState extends ProductsDetailsState {
  final Products product;
  final Dimensions dimensions;

  ProductsDetailsSuccessState({
    required this.product,
    required this.dimensions,
  });
}

final class ProductsDetailsNotFoundState extends ProductsDetailsState {}

final class ProductsDetailsFailureState extends ProductsDetailsState {
  final String errorMessage;

  ProductsDetailsFailureState({required this.errorMessage});
}
