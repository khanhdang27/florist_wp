part of 'bag_bloc.dart';

@immutable
abstract class BagEvent {}

class BagGetOne extends BagEvent {
  final int id;

  BagGetOne({this.id});
}

class BagDelete extends BagEvent {
  final int id;
  final int total;

  BagDelete({this.id, this.total});
}
class UpdateBag extends BagEvent {
  final int id;
  final String name;
  final String phone;
  final String address;
  final String pay;

  UpdateBag({this.id, this.name, this.pay, this.phone, this.address});
}