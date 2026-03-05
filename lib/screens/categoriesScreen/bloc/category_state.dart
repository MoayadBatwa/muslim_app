part of 'category_bloc.dart';

@immutable
sealed class CategoryState {}

final class CategoryInitial extends CategoryState {}

final class CategoriesState extends CategoryState {
  final List<AzkarCategory> categories;

  CategoriesState({required this.categories});
}

final class PrayersTimeState extends CategoryState {
  final PrayerTime prayersTime;

  PrayersTimeState({required this.prayersTime});
}

final class ErrorCategoriesState extends CategoryState{}

final class ErrorPrayersTimeState extends CategoryState{}
