import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/errors/exceptions.dart';
import '../../domain/repositories/product_details_repository.dart';
import 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit(this._repository) : super(const ProductDetailsInitial());

  final ProductDetailsRepository _repository;

  Future<void> fetchProductDetails(int productId) async {
    emit(const ProductDetailsLoading());

    try {
      final product = await _repository.getProductDetails(productId);
      emit(ProductDetailsLoaded(product));
    } on ServerException catch (e) {
      emit(ProductDetailsFailure(e.message));
    } on NetworkException catch (e) {
      emit(ProductDetailsFailure(e.message));
    } catch (_) {
      emit(
        const ProductDetailsFailure(
          'Something went wrong while loading the product. Please try again.',
        ),
      );
    }
  }
}
