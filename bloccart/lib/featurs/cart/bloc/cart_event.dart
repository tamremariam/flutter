part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}

class CartIntialEvent extends CartEvent {}

class CartRemoverEvent extends CartEvent {}
