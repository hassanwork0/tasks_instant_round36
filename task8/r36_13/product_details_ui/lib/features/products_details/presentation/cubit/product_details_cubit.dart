import 'package:bloc/bloc.dart';
import 'package:product_details_ui/core/api/api_result.dart';
import 'package:product_details_ui/core/api/expections/faliure.dart';
import 'package:product_details_ui/features/products_details/data/models/products_details_model.dart';
import 'package:product_details_ui/features/products_details/data/repo/product_details_repo.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit(this._repo) : super(ProductDetailsInitialState());

  final ProductDetailsRepo _repo;
  void getproductDetails({required int productId}) async {
    emit(ProductDetailsLoadingState());
    final apiResult = await _repo.getProductDetails(productId: productId);
    switch (apiResult) {
      case ApiSuccess<ProductDetailsModel>(:final data):
        emit(ProductDetailsSuccessState(data: data));

      case ApiFailure<ProductDetailsModel>(:final failure):
        emit(failure is NotFoundFailure ? ProductDetailsNotFoundState() : ProductDetailsFailureState(message: failure.message));
    }
  }
}
