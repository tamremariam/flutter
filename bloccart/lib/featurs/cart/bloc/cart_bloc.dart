import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloccart/data/cart_item.dart';
import 'package:bloccart/featurs/home/models/home_product_data_model.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartEvent>((event, emit) {
      on<CartIntialEvent>(cartIntialEvent);
    });
  }

  FutureOr<void> cartIntialEvent(
      CartIntialEvent event, Emitter<CartState> emit) {
    emit(CartSucessState(cartitems: cartitems));
  }
}
