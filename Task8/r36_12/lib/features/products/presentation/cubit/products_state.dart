part of 'products_cubit.dart';

sealed class ProductsState {
  const ProductsState();
}

class ProductsInitialState extends ProductsState {
  const ProductsInitialState();
}

class ProductsLoadingState extends ProductsState {
  const ProductsLoadingState();
}

class ProductsSuccessState extends ProductsState {
  final List<Products> products;
  final bool hasMore;
  final bool isLoadingMore;

  const ProductsSuccessState({
    required this.products,
    required this.hasMore,
    this.isLoadingMore = false,
  });

  ProductsSuccessState copyWith({
    List<Products>? products,
    bool? hasMore,
    bool? isLoadingMore,
  }) {
    return ProductsSuccessState(
      products: products ?? this.products,
      hasMore: hasMore ?? this.hasMore,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }
}

class ProductsEmptyState extends ProductsState {
  const ProductsEmptyState();
}

class ProductsFailureState extends ProductsState {
  final String errorMessage;
  ProductsFailureState({required this.errorMessage});
}
