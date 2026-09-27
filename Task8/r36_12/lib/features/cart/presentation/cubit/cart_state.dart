part of 'cart_cubit.dart';

sealed class CartState {}

//get cart
final class CartInitialState extends CartState {}

final class CartLoadingState extends CartState {}

final class CartSuccessState extends CartState {
  final CartModel cart;

  CartSuccessState({required this.cart});
}

final class CartFailureState extends CartState {
  final String error;

  CartFailureState({required this.error});
}

//add cart
final class AddCartLoadingState extends CartState {}

final class AddCartSuccessState extends CartState {
  final AUDToCartModel addTOCart;

  AddCartSuccessState({required this.addTOCart});
}

final class AddCartFailureState extends CartState {
  final String error;

  AddCartFailureState({required this.error});
}

//update cart
final class UpdateCartLoadingState extends CartState {}

final class UpdateCartSuccessState extends CartState {
  final int productId;

  UpdateCartSuccessState({required this.productId});
}

final class UpdateCartFailureState extends CartState {
  final String error;

  UpdateCartFailureState({required this.error});
}

//delete cart

final class DeleteCartLoadingState extends CartState {}

final class DeleteCartSuccessState extends CartState {}

final class DeleteCartFailureState extends CartState {
  final String error;

  DeleteCartFailureState({required this.error});
}
