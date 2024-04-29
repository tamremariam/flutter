import 'package:bloccart/featurs/cart/ui/cart.dart';
import 'package:bloccart/featurs/home/bloc/home_bloc.dart';
import 'package:bloccart/featurs/home/ui/product_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  final HomeBloc homeBloc = HomeBloc();
  @override
  void initState() {
    homeBloc.add(HomeIntialEvent());
    super.initState();
  }

  @override
  void dispose() {
    homeBloc.close(); // Dispose of the bloc when not needed anymore
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
        bloc: homeBloc,
        listenWhen: (previous, current) => current is HomeActionState,
        buildWhen: (previous, current) => current is! HomeActionState,
        listener: (context, state) {
          if (state is HomeNavigateToCartPageActionState) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const cart()));
          } else if (state is HomeProductItemCartedActionState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("product is carted")));
          }
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case HomeLoadingState:
              return const Scaffold(
                  body: Center(
                child: CircularProgressIndicator(),
              ));

            case HomeLoadedSuccessState:
              final successState = state as HomeLoadedSuccessState;
              return Scaffold(
                appBar: AppBar(
                  title: const Text("tikus food"),
                  backgroundColor: Colors.green,
                  actions: [
                    IconButton(
                        onPressed: () {
                          homeBloc.add(HomeProductcartNavigatEvent());
                        },
                        icon: Icon(Icons.shopify_rounded))
                  ],
                ),
                body: ListView.builder(
                    itemCount: successState.products.length,
                    itemBuilder: (context, index) {
                      return ProductTileWidget(
                          homeBloc: homeBloc,
                          productDataModel: successState.products[index]);
                    }),
              );

            case HomeloadedFailureActionState:
              return Scaffold(
                body: const Center(
                  child: Text("error occured"),
                ),
              );

            default:
              return SizedBox();
          }
        });
  }
}
