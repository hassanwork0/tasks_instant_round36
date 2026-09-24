import '../../data/models/product_summary_model.dart';

sealed class ProductListState {
  const ProductListState();
}

class ProductListInitial extends ProductListState {
  const ProductListInitial();
}

class ProductListLoading extends ProductListState {
  const ProductListLoading();
}

class ProductListLoaded extends ProductListState {
  const ProductListLoaded(this.products);

  final List<ProductSummaryModel> products;
}

class ProductListFailure extends ProductListState {
  const ProductListFailure(this.message);

  final String message;
}
