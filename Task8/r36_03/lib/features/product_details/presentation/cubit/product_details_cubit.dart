import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task8/features/product_details/data/repo/product_details_repository_impl.dart';
import 'package:task8/features/product_details/presentation/cubit/product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  final ProductDetailsRepository repository;

  ProductDetailsCubit(this.repository) : super(ProductDetailsInitialState());

  Future<void> fetchProductDetails(int id) async {
    emit(ProductDetailsLoadingState());
    try {
      final product = await repository.getProductDetails(id);
      emit(ProductDetailsLoadedState(product));
    } catch (e) {
      emit(ProductDetailsFailureState(e.toString()));
    }
  }
}
