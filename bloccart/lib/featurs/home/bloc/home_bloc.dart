import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloccart/data/cart_item.dart';
import 'package:bloccart/data/grocery_data.dart';
import 'package:bloccart/featurs/home/models/home_product_data_model.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeIntialEvent>(homeIntialEvent);
    on<HomeProductcartNavigatEvent>(homeProductcartNavigatEvent);
    on<HomeProductCartCuttonClickedEvent>(homeProductCartCuttonClickedEvent);
  }
  FutureOr<void> homeIntialEvent(
      HomeIntialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(const Duration(seconds: 3));
    // emit(HomeloadedSuccessState(products: ProductsDataModel))
    emit(HomeLoadedSuccessState(
        products: GroceryData.groceryProducts
            .map((e) => ProductDataModel(
                id: e['id'],
                name: e['name'],
                description: e['description'],
                price: e['price'],
                imageUrl: e['imageUrl']))
            .toList()));
  }

  FutureOr<void> homeProductcartNavigatEvent(
      HomeProductcartNavigatEvent event, Emitter<HomeState> emit) {
    print("cart is clicked");
    emit(HomeNavigateToCartPageActionState());
    // cartitems.add(event.clickedproduct);
  }

  FutureOr<void> homeProductCartCuttonClickedEvent(
      HomeProductCartCuttonClickedEvent event, Emitter<HomeState> emit) {
    print("cart item is cliked");

    cartitems.add(event.clickedproduct);
    emit(HomeProductItemCartedActionState());
  }
}
