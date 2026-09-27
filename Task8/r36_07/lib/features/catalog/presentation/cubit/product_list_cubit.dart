import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/errors/exceptions.dart';
import '../../domain/repositories/product_list_repository.dart';
import 'product_list_state.dart';

class ProductListCubit extends Cubit<ProductListState> {
  ProductListCubit(this._repository) : super(const ProductListInitial());

  final ProductListRepository _repository;

  Future<void> fetchProducts() async {
    emit(const ProductListLoading());

    try {
      final products = await _repository.getProducts();
      emit(ProductListLoaded(products));
    } on ServerException catch (e) {
      emit(ProductListFailure(e.message));
    } on NetworkException catch (e) {
      emit(ProductListFailure(e.message));
    } catch (_) {
      emit(
        const ProductListFailure(
          'Something went wrong while loading products. Please try again.',
        ),
      );
    }
  }
}
