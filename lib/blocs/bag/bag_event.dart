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