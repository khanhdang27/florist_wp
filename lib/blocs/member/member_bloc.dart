import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:gut7/models/models.dart';
import 'package:gut7/repositories/member_repository.dart';
import 'package:meta/meta.dart';

part 'member_event.dart';
part 'member_state.dart';

class MemberBloc extends Bloc<MemberEvent, MemberState> {
  MemberBloc() : super(MemberInitial());
  final MemberRepository memberRepository = MemberRepository();

  @override
  Stream<MemberState> mapEventToState(MemberEvent event,) async* {
    if (event is MemberGetOne) {
      Member member = await memberRepository.getOne(Id: event.Id);
      if (true) {
        yield MemberGetOneSuccess(
          item: member,
        );
      } else {
        yield MemberGetOneFailed();
      }
    }
  }
}
