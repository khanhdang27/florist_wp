part of 'member_bloc.dart';

@immutable
abstract class MemberEvent {}

class MemberGetOne extends MemberEvent {
  final int Id;

  MemberGetOne({this.Id});
}
