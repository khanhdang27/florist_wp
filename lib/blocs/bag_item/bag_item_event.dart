part of 'bag_item_bloc.dart';

@immutable
abstract class BagItemEvent {}

class AddBagItem extends BagItemEvent {
  final int bag_id;
  final int product_id;
  final int quantity;

  AddBagItem({this.bag_id, this.product_id, this.quantity});
}

// class ChangeQuantity extends BagItemEvent {
//   final int quantity;
//   final int id;
//
//   ChangeQuantity({this.quantity, this.id});
// }
//
// class DeleteItem extends BagItemEvent {
//   final int id;
//
//   DeleteItem({this.id});
// }
