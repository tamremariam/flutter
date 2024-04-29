part of 'cart_bloc.dart';

@immutable
abstract class CartState {}

abstract class CartActionState {}

final class CartInitial extends CartState {}

class CartSucessState extends CartState {
  final List<ProductDataModel> cartitems;

  CartSucessState({required this.cartitems});
}
