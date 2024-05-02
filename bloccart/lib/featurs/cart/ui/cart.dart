import 'package:bloccart/featurs/cart/bloc/cart_bloc.dart';
import 'package:bloccart/featurs/cart/ui/cart_product_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class cart extends StatefulWidget {
  const cart({super.key});

  @override
  State<cart> createState() => _cartState();
}

class _cartState extends State<cart> {
  final CartBloc cartBloc = CartBloc();
  @override
  void initState() {
    cartBloc.add(CartIntialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("cart page"),
        backgroundColor: Colors.green,
      ),
      body: BlocConsumer<CartBloc, CartState>(
        bloc: cartBloc,
        listener: (context, state) {},
        listenWhen: (previous, current) => current is CartActionState,
        buildWhen: (previous, current) => current is! CartActionState,
        builder: (context, state) {
          switch (state.runtimeType) {
            case CartSucessState:
              final successstate = state as CartSucessState;
              return Scaffold();
            // ListView.builder(
            // itemCount: successstate.cartitems.length,
            // itemBuilder: (context, index) {
            //   return CartTileWidget(
            //       cartBloc: cartBloc,
            //       productDataModel: successstate.cartitems[index]);
            // });

            default:
              return const Scaffold(
                body: Center(
                  child: Text("error ocured"),
                ),
              );
          }
        },
      ),
    );
  }
}
