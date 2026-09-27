import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_products/core/network/api_result.dart';
import 'package:task_products/features/cart/data/models/aud_to_cart_model.dart';
import 'package:task_products/features/cart/data/repo/cart_repo.dart';
import '../../data/models/cart_model.dart';
part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepo _repo;
  Timer? _updateCartDebounce;
  CartCubit(CartRepo repo) : _repo = repo, super(CartInitialState());

  Future<void> getCart() async {
    emit(CartLoadingState());

    final result = await _repo.getCart();

    switch (result) {
      case ApiSuccess(:final data):
        emit(CartSuccessState(cart: data));
      case ApiFailure(:final failure):
        emit(CartFailureState(error: failure.message));
    }
  }

  Future<void> addToCart({
    required int productId,
    required int quantity,
  }) async {
    emit(AddCartLoadingState());

    final result = await _repo.addToCart(
      productId: productId,
      quantity: quantity,
    );

    switch (result) {
      case ApiSuccess(:final data):
        emit(AddCartSuccessState(addTOCart: data));

      case ApiFailure(:final failure):
        emit(AddCartFailureState(error: failure.message));
    }
  }

  Future<void> updateCart({
    required int productId,
    required int quantity,
  }) async {
    _updateCartDebounce?.cancel();

    _updateCartDebounce = Timer(Duration(milliseconds: 450), () async {
      emit(UpdateCartLoadingState());

      final result = await _repo.updateToCart(
        productId: productId,
        quantity: quantity,
      );

      switch (result) {
        case ApiSuccess(:final data):
          //emit(UpdateCartSuccessState(productId: productId));
          //await getCart();
          final cartModel = CartModel.fromJson(data.toJson());
          emit(CartSuccessState(cart: cartModel));

        case ApiFailure(:final failure):
          emit(UpdateCartFailureState(error: failure.message));
      }
    });
  }

  Future<void> deleteCart() async {
    emit(DeleteCartLoadingState());

    final result = await _repo.deleteCart();

    switch (result) {
      case ApiSuccess():
        emit(DeleteCartSuccessState());
      case ApiFailure(:final failure):
        emit(DeleteCartFailureState(error: failure.message));
    }
  }

  @override
  Future<void> close() {
    _updateCartDebounce?.cancel();
    return super.close();
  }
}
