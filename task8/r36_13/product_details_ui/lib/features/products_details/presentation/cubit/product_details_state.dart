part of 'product_details_cubit.dart';

sealed class ProductDetailsState {}

final class ProductDetailsInitialState extends ProductDetailsState {}

final class ProductDetailsLoadingState extends ProductDetailsState {}

final class ProductDetailsSuccessState extends ProductDetailsState {
  final ProductDetailsModel data;

  ProductDetailsSuccessState({required this.data});
}

final class ProductDetailsNotFoundState extends ProductDetailsState {}

final class ProductDetailsFailureState extends ProductDetailsState {
  final String message;

  ProductDetailsFailureState({required this.message});

}
