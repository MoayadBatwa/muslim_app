part of 'category_bloc.dart';

@immutable
sealed class CategoryState {}

final class CategoryInitial extends CategoryState {}

final class CategoriesState extends CategoryState {
  final List<AzkarCategory> categories;

  CategoriesState({required this.categories});
}
