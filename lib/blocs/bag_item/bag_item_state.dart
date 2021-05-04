part of 'bag_item_bloc.dart';

@immutable
abstract class BagItemState {}

class BagItemInitial extends BagItemState {}

class AddBagItemSuccess extends BagItemState{}
class AddBagItemFailed extends BagItemState{}

// class ChangeQuantitySuccess extends BagItemState{
//   final int total;
//
//   ChangeQuantitySuccess({this.total});
// }
// class ChangeQuantityFailed extends BagItemState{}
//
// class DeleteItemSuccess extends BagItemState{
//   final Bag item;
//
//   DeleteItemSuccess({this.item});
// }
// class DeleteItemFailed extends BagItemState{}