import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_data_flutter/muslim_data_flutter.dart' as muslim_pack;
import 'package:muslim_data_flutter/muslim_data_flutter.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final muslimRepo = muslim_pack.MuslimRepository();

  CategoryBloc() : super(CategoryInitial()) {
    on<GetCategoriesEvent>((event, emit) async {
      final categories = await muslimRepo.getAzkarCategories();
      
      emit(CategoriesState(categories: categories));
    });
  }
}
