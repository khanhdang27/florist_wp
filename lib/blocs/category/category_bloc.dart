import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:gut7/models/models.dart';
import 'package:gut7/repositories/category_repository.dart';
import 'package:meta/meta.dart';

part 'category_event.dart';

part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(CategoryInitial());
  final CategoryRepository categoryRepository = CategoryRepository();

  @override
  Stream<CategoryState> mapEventToState(CategoryEvent event) async* {
    if (event is CategoryGetAll) {
      List<Category> categories = await categoryRepository.getAll();
      if (true) {
        yield CategoryGetAllSuccess(
          items: categories,
        );
      } else {
        yield CategoryGetAllFailed();
      }
    }
    if (event is ThemCate) {
      //do do do
      int stt = await categoryRepository.themCate(event.name);
      if (stt == 1) {
        yield ThemCateSuccess();
      } else {
        yield ThemCateFailed();
      }
    }
  }
}
