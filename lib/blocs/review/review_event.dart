part of 'review_bloc.dart';

@immutable
abstract class ReviewEvent {}

class ReviewGetAll extends ReviewEvent {
  final int productId;

  ReviewGetAll({this.productId});
}
