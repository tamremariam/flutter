part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeIntialEvent extends HomeEvent {}

class HomeProductCartCuttonClickedEvent extends HomeEvent {
  final ProductDataModel clickedproduct;

  HomeProductCartCuttonClickedEvent({required this.clickedproduct});
}

class HomeProductcartNavigatEvent extends HomeEvent {}
