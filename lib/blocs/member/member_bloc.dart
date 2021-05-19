import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:florist/models/models.dart';
import 'package:florist/repositories/member_repository.dart';
import 'package:meta/meta.dart';

part 'member_event.dart';

part 'member_state.dart';

class MemberBloc extends Bloc<MemberEvent, MemberState> {
  MemberBloc() : super(MemberInitial());
  final MemberRepository memberRepository = MemberRepository();

  @override
  Stream<MemberState> mapEventToState(
    MemberEvent event,
  ) async* {
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

    if (event is MemberRegister) {
      int stt = await memberRepository.memberRegister(
          name: event.name,
          phone: event.phone,
          email: event.email,
          pass: event.pass);
      if (stt == 1) {
        yield MemberRegisterSuccess();
      } else {
        yield MemberRegisterFailed();
      }
    }

    if (event is ForgotPass) {
      Map result = await memberRepository.forgotPass(email: event.email);
      if (result['code'] != 'error') {
        yield ForgotPassSuccess(
          code: result['code'],
          id: result['id'],
        );
      } else {
        yield ForgotPassFailed();
      }
    }

    if (event is ResetPass) {
      int result = await memberRepository.resetPass(pass: event.pass,id: event.id);
      if (result == 1) {
        print('ksjdhf');
        yield ForgotPassSuccess();
      } else {
        print('sdfsdfsdfsdfsf');
        yield ForgotPassFailed();
      }
    }
  }
}
