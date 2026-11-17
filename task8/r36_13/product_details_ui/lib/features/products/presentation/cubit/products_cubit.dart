
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_details_ui/core/api/api_result.dart';
import 'package:product_details_ui/features/products/data/models/product_model.dart';
import 'package:product_details_ui/features/products/data/repo/products_repo.dart';


part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this._repo) : super(ProductsInitialState());

  final ProductsRepo _repo;

  static const int _pageSize = 20;

  int _skip = 0;
  bool _isFetching = false;

  Future<void> loadFirstPage() async {
    _skip = 0;
    emit(const ProductsLoadingState());
    final result = await _repo.getProducts(limit: _pageSize, skip: 0);

    switch (result) {
      case ApiSuccess(:final data):
        _skip = data.products.length;
        emit(
          data.products.isEmpty
              ? const ProductsEmptyState()
              : ProductsSuccessState(
                  products: data.products,
                  hasMore: data.hasMore,
                ),
        );
      case ApiFailure(:final failure):
        emit(ProductsFaliureState(failure.message));
    }
  }

  Future<void> loadNextPage() async {
    final current = state;

    if (current is! ProductsSuccessState) return;
    if (!current.hasMore || _isFetching) return;

    _isFetching = true;
    emit(current.copyWith(isLoadingMore: true)); 

    final result = await _repo.getProducts(limit: _pageSize, skip: _skip);
    _isFetching = false;

    switch (result) {
      case ApiSuccess(:final data):
        _skip += data.products.length;
        emit(
          current.copyWith(
            products: [...current.products, ...data.products], 
            hasMore: data.hasMore,
            isLoadingMore: false,
          ),
        );
      case ApiFailure():

        emit(current.copyWith(isLoadingMore: false));
    }
  }
}


