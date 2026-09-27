import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_products/features/products/data/repo/products_repo.dart';
import '../../../../core/network/api_result.dart';
import '../../data/models/products_model.dart';
part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final ProductsRepo _productsRepo;
  ProductsCubit(this._productsRepo) : super(ProductsInitialState());

  static const int _pageSize = 20;
  int _skip = 0;
  bool _isFetching = false;

  Future<void> loadFirstPage() async {
    _skip = 0;
    emit(ProductsLoadingState());

    final result = await _productsRepo.getProducts(limit: _pageSize, skip: 0);

    switch (result) {
      case ApiSuccess(data: final data):
        _skip = data.products.length;
        data.products.isEmpty
            ? emit(ProductsEmptyState())
            : emit(
                ProductsSuccessState(
                  products: data.products,
                  hasMore: data.hasMore,
                ),
              );

      case ApiFailure(failure: final failure):
        emit(ProductsFailureState(errorMessage: failure.message));
    }
  }

  Future<void> loadNextPage() async {
    final current = state;
    if (current is! ProductsSuccessState) return;
    if (!current.hasMore || _isFetching) return;

    _isFetching = true;
    emit(current.copyWith(isLoadingMore: true));

    final result = await _productsRepo.getProducts(
      limit: _pageSize,
      skip: _skip,
    );
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
