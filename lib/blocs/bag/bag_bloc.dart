import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:florist/models/models.dart';
import 'package:florist/repositories/bag_repository.dart';
import 'package:meta/meta.dart';

part 'bag_event.dart';
part 'bag_state.dart';

class BagBloc extends Bloc<BagEvent, BagState> {
  BagBloc() : super(BagInitial());
  final BagRepository bagRepository = BagRepository();

  @override
  Stream<BagState> mapEventToState(BagEvent event) async* {
    if (event is BagGetOne) {
      Map result = await bagRepository.getOne(id: event.id);
      if (true) {
        yield BagGetOneSuccess(
          item: result['bag'],
          total: result['total'],
        );
      } else {
        yield BagGetOneFailed();
      }
    }
    if (event is BagDelete) {
      var currentState = state; //BagGetOneSuccess
      if (currentState is BagGetOneSuccess) {
        currentState.item.bagItem.removeWhere((element) {
          return element.id == event.id;
        });
        yield BagGetOneSuccess(
          item: currentState.item,
          total: event.total,
          diff: event.id,
        );
      }
    }
  }
}
