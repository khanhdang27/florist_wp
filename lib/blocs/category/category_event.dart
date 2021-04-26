part of 'category_bloc.dart';

@immutable
abstract class CategoryEvent {}

class CategoryGetAll extends CategoryEvent {}

class ThemCate extends CategoryEvent {
  final String name;

  ThemCate({this.name});
}
