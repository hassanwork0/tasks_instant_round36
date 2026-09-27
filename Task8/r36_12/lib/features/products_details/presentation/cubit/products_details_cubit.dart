import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_products/core/network/api_result.dart';
import 'package:task_products/core/network/exceptions/failure.dart';
import 'package:task_products/features/products/data/models/products_model.dart';
import 'package:task_products/features/products_details/data/repo/products_details_repo.dart';
part 'products_details_state.dart';

class ProductsDetailsCubit extends Cubit<ProductsDetailsState> {
  final ProductsDetailsRepo _repo;

  ProductsDetailsCubit(ProductsDetailsRepo repo)
    : _repo = repo,
      super(ProductsDetailsInitialState());

  Future<void> getProductDetails({required int productId}) async {
    emit(ProductsDetailsLoadingState());

    final result = await _repo.getProductDetails(productId: productId);

    switch (result) {
      case ApiSuccess(:final data):
        emit(
          ProductsDetailsSuccessState(
            product: data,
            dimensions: data.dimensions,
          ),
        );
      case ApiFailure(:final failure):
        emit(
          failure is NotFoundFailure
              ? ProductsDetailsNotFoundState()
              : ProductsDetailsFailureState(errorMessage: failure.message),
        );
    }
  }
}
