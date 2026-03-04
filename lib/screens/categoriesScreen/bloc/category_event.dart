part of 'category_bloc.dart';

@immutable
sealed class CategoryEvent {}

final class GetCategoriesEvent extends CategoryEvent {}

final class GetPrayersTimeEvent extends CategoryEvent {}
