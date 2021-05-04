import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:florist/models/models.dart';
import 'package:florist/repositories/shipping_repository.dart';
import 'package:meta/meta.dart';

part 'shipping_event.dart';
part 'shipping_state.dart';

class ShippingBloc extends Bloc<ShippingEvent, ShippingState> {
  ShippingBloc() : super(ShippingInitial());
  final ShippingRepository shippingRepository = ShippingRepository();

  @override
  Stream<ShippingState> mapEventToState(ShippingEvent event,) async* {
    if (event is ShippingGetOne) {
      Shipping shipping = await shippingRepository.getOne(Id: event.Id);
      if (true) {
        yield ShippingGetOneSuccess(
          item: shipping,
        );
      } else {
        yield ShippingGetOneFailed();
      }
    }
  }
}
