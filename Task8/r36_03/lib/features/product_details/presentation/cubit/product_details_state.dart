import '../../data/model/product_details_model.dart';

sealed class ProductDetailsState {}

final class ProductDetailsInitialState extends ProductDetailsState {}

final class ProductDetailsLoadingState extends ProductDetailsState {}

final class ProductDetailsLoadedState extends ProductDetailsState {
  final ProductDetailsModel product;
  ProductDetailsLoadedState(this.product);
}

final class ProductDetailsFailureState extends ProductDetailsState {
  final String errorMessage;
  ProductDetailsFailureState(this.errorMessage);
}
