import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:florist/models/models.dart';
import 'package:meta/meta.dart';
import 'package:florist/repositories/bag_item_repository.dart';
part 'bag_item_event.dart';
part 'bag_item_state.dart';

class BagItemBloc extends Bloc<BagItemEvent, BagItemState> {
  BagItemBloc() : super(BagItemInitial());
  final BagItemRepository bagItemRepository = BagItemRepository();

  @override
  Stream<BagItemState> mapEventToState(BagItemEvent event,) async* {
    if (event is AddBagItem) {
      int stt = await bagItemRepository.addBagItem(
          bag_id: event.bag_id,
          product_id: event.product_id,
          quantity: event.quantity);
      if (stt == 1) {
        yield AddBagItemSuccess();
      } else {
        yield AddBagItemFailed();
      }
    }

    // if (event is ChangeQuantity) {
    //   int total = await bagItemRepository.changeQuantity(
    //       bag_item_id: event.id, quantity: event.quantity);
    //   if (total != null) {
    //     yield ChangeQuantitySuccess(
    //       total: total,
    //     );
    //   } else {
    //     yield ChangeQuantityFailed();
    //   }
    // }
    //
    // if (event is DeleteItem) {
    //   Map bag = await bagItemRepository.deleteItem(bag_item_id: event.id);//item con lai, total
    //   WishlistState bagState = AppBloc.bagBloc.state;
    //   if (bagState is WishlistGetOneSuccess) {
    //     AppBloc.bagBloc.add(WishlistDelete(id: event.id, total: wishList['total']));
    //   }

  }
}
