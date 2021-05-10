part of 'bag_bloc.dart';

@immutable
abstract class BagState extends Equatable {}

class BagInitial extends BagState {
  @override
  List<Object> get props => [];
}

class BagGetOneSuccess extends BagState {
  final Bag item;
  final int total;
  final int diff;

  BagGetOneSuccess({this.item, this.total, this.diff = 0});

  @override
  List<Object> get props => [item, total, diff];
}

class BagGetOneFailed extends BagState {
  @override
  List<Object> get props => [];
}

class UpdateBagSuccess extends BagState{
  @override
  List<Object> get props => [];
}
class UpdateBagFailed extends BagState{
  @override
  List<Object> get props => [];
}