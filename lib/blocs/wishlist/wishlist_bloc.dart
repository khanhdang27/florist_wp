import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gut7/models/models.dart';
import 'package:gut7/repositories/wishlist_repository.dart';
import 'package:meta/meta.dart';

part 'wishlist_event.dart';

part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial());
  final WishlistRepository wishlistRepository = WishlistRepository();

  @override
  Stream<WishlistState> mapEventToState(WishlistEvent event) async* {
    if (event is WishlistGetOne) {
      Map result = await wishlistRepository.getOne(id: event.id);
      if (true) {
        yield WishlistGetOneSuccess(
          item: result['wishlist'],
          total: result['total'],
        );
      } else {
        yield WishlistGetOneFailed();
      }
    }
    if (event is WishlistDelete) {
      var currentState = state; //WishlistGetOneSuccess
      if (currentState is WishlistGetOneSuccess) {
        currentState.item.wishListItem.removeWhere((element) {
          return element.id == event.id;
        });
        yield WishlistGetOneSuccess(
          item: currentState.item,
          total: event.total,
          diff: event.id,
        );
      }
    }
  }
}
