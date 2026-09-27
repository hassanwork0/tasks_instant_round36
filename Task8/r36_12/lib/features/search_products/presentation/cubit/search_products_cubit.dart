import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_products/core/network/api_result.dart';
import 'package:task_products/core/network/exceptions/failure.dart';
import 'package:task_products/features/products/data/models/products_model.dart';
import 'package:task_products/features/search_products/data/repo/search_products_repo.dart';
part 'search_products_state.dart';

class SearchProductsCubit extends Cubit<SearchProductsState> {
  final SearchProductsRepo _repo;

  SearchProductsCubit(this._repo) : super(SearchProductsInitialState());

  Timer? _debounce;
  CancelToken? _cancelToken;

  void onQueryChanged(String query) {
    _debounce?.cancel();

    if (query.trim().length < 2) {
      _cancelToken?.cancel("Search length less than 2");
      emit(SearchProductsInitialState());
      return;
    }

    _debounce = Timer(Duration(milliseconds: 450), () {
      _runSearch(query.trim());
    });
  }

  Future<void> _runSearch(String query) async {
    _cancelToken?.cancel("New search initiated, delete previous search");
    _cancelToken = CancelToken();

    emit(SearchProductsLoadingState());

    final result = await _repo.getSearch(query, cancelToken: _cancelToken);

    switch (result) {
      case ApiSuccess(:final data):
        emit(
          data.products.isEmpty
              ? SearchProductsEmptyState()
              : SearchProductsSuccessState(products: data.products),
        );

      case ApiFailure(:final failure):
        if (failure is CancelledFailure) {
          return;
        }
        emit(SearchProductsFailureState(errorMessage: failure.message));
    }
  }

  @override
  Future<void> close() {
    _debounce?.cancel();
    _cancelToken?.cancel();
    return super.close();
  }
}
