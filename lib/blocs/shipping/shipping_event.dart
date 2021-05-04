part of 'shipping_bloc.dart';

@immutable
abstract class ShippingEvent {}
class ShippingGetOne extends ShippingEvent {
  final int Id;

  ShippingGetOne({this.Id});
}