part of 'member_bloc.dart';

@immutable
abstract class MemberEvent {}

class MemberGetOne extends MemberEvent {
  final int Id;

  MemberGetOne({this.Id});
}

class MemberRegister extends MemberEvent {
  final String name;
  final String phone;
  final String email;
  final String pass;

  MemberRegister({this.name, this.phone, this.email, this.pass});
}
