import '../../data/models/product_details_model.dart';

sealed class ProductDetailsState {
  const ProductDetailsState();
}

class ProductDetailsInitial extends ProductDetailsState {
  const ProductDetailsInitial();
}

class ProductDetailsLoading extends ProductDetailsState {
  const ProductDetailsLoading();
}

class ProductDetailsLoaded extends ProductDetailsState {
  const ProductDetailsLoaded(this.product);

  final ProductDetailsModel product;
}

class ProductDetailsFailure extends ProductDetailsState {
  const ProductDetailsFailure(this.message);

  final String message;
}
