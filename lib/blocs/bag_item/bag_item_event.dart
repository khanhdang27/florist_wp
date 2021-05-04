part of 'bag_item_bloc.dart';

@immutable
abstract class BagItemEvent {}

class AddBagItem extends BagItemEvent {
  final int bag_id;
  final int product_id;
  final int quantity;

  AddBagItem({this.bag_id, this.product_id, this.quantity});
}

class AddAllBagItem extends BagItemEvent {
  final int bag_id;
  final int wishlist_id;

  AddAllBagItem({this.bag_id, this.wishlist_id});
}

class BagChangeQuantity extends BagItemEvent {
  final int quantity;
  final int id;

  BagChangeQuantity({this.quantity, this.id});
}

class BagDeleteItem extends BagItemEvent {
  final int id;

  BagDeleteItem({this.id});
}
