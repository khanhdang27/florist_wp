import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:gut7/models/models.dart';
import 'package:gut7/repositories/review_repository.dart';
import 'package:meta/meta.dart';

part 'review_event.dart';

part 'review_state.dart';

class ReviewBloc extends Bloc<ReviewEvent, ReviewState> {
  ReviewBloc() : super(ReviewInitial());
  final ReviewRepository reviewRepository = ReviewRepository();

  @override
  Stream<ReviewState> mapEventToState(ReviewEvent event) async* {
    if (event is ReviewGetAll) {
      List<Review> reviews = await reviewRepository.getAll(event.productId);
      if (true) {
        yield ReviewGetAllSuccess(
          items: reviews,
        );
      } else {
        yield ReviewGetAllFailed();
      }
    }
  }
}
