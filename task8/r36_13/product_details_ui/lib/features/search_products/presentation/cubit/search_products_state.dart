part of 'search_products_cubit.dart';

sealed class SearchProductsState {
  const SearchProductsState();
}

class SearchProductsInitialState extends SearchProductsState {
  const SearchProductsInitialState();
}

class SearchProductsLoadingState extends SearchProductsState {
  const SearchProductsLoadingState();
}

class SearchProductsSuccessState extends SearchProductsState {
  final List<Products> products;
  final bool hasMore;
  final bool isLoadingMore;

  const SearchProductsSuccessState({
    required this.products,
    required this.hasMore,
    this.isLoadingMore = false,
  });

  SearchProductsSuccessState copyWith({
    List<Products>? products,
    bool? hasMore,
    bool? isLoadingMore,
  }) {
    return SearchProductsSuccessState(
      products: products ?? this.products,
      hasMore: hasMore ?? this.hasMore,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }
}

class SearchProductsEmptyState extends SearchProductsState {
  const SearchProductsEmptyState();
}

class SearchProductsFaliureState extends SearchProductsState {
  final String message;
  const SearchProductsFaliureState(this.message);
}
