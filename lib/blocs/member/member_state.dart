part of 'member_bloc.dart';

@immutable
abstract class MemberState {}

class MemberInitial extends MemberState {}

class MemberGetOneSuccess extends MemberState{
  final Member item;

  MemberGetOneSuccess({this.item});
}

class MemberGetOneFailed extends MemberState{}