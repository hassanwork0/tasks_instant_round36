part of 'search_products_cubit.dart';

sealed class SearchProductsState {
  const SearchProductsState();
}

final class SearchProductsInitialState extends SearchProductsState {
  const SearchProductsInitialState();
}

final class SearchProductsLoadingState extends SearchProductsState {
  const SearchProductsLoadingState();
}

final class SearchProductsEmptyState extends SearchProductsState {
  const SearchProductsEmptyState();
}

final class SearchProductsSuccessState extends SearchProductsState {
  final List<Products> products;
  const SearchProductsSuccessState({required this.products});
}

final class SearchProductsFailureState extends SearchProductsState {
  final String errorMessage;
  const SearchProductsFailureState({required this.errorMessage});
}
