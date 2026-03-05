import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_app/screens/categoriesScreen/bloc/category_bloc.dart';
import 'package:muslim_app/widgets/prayer_times_widget.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CategoryBloc(),
      child: Builder(
        builder: (context) {
          context.read<CategoryBloc>().add(GetCategoriesEvent());
          context.read<CategoryBloc>().add(GetPrayersTimeEvent());

          return Scaffold(
            appBar: AppBar(
              title: Text("Athkar Categories"),
              centerTitle: true,
              backgroundColor: const Color.fromARGB(255, 96, 218, 25),
            ),

            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SingleChildScrollView(
                    scrollDirection: .horizontal,
                    child: BlocBuilder<CategoryBloc, CategoryState>(
                      buildWhen: (previous, current) {
                        if (current is CategoryInitial) {
                          return true;
                        }

                        if (current is PrayersTimeState) {
                          return true;
                        }

                        if (current is ErrorPrayersTimeState) {
                          return true;
                        }

                        return false;
                      },

                      builder: (context, state) {
                        if (state is CategoryInitial) {
                          return Center(child: CircularProgressIndicator());
                        }

                        if (state is PrayersTimeState) {
                          return Row(
                            children: [
                              PrayerTimesWidget(
                                prayerName: 'Fajr',
                                prayerTime: state.prayersTime.fajr.toString(),
                              ),

                              SizedBox(width: 10),

                              PrayerTimesWidget(
                                prayerName: 'Dhuhr',
                                prayerTime: state.prayersTime.dhuhr.toString(),
                              ),

                              SizedBox(width: 10),

                              PrayerTimesWidget(
                                prayerName: 'Asr',
                                prayerTime: state.prayersTime.asr.toString(),
                              ),

                              SizedBox(width: 10),

                              PrayerTimesWidget(
                                prayerName: 'Maghrib',
                                prayerTime: state.prayersTime.maghrib
                                    .toString(),
                              ),

                              SizedBox(width: 10),

                              PrayerTimesWidget(
                                prayerName: 'Isha',
                                prayerTime: state.prayersTime.isha.toString(),
                              ),
                            ],
                          );
                        }

                        return SizedBox.shrink();
                      },
                    ),
                  ),

                  SizedBox(height: 15),

                  BlocBuilder<CategoryBloc, CategoryState>(
                    buildWhen: (previous, current) {
                      if (current is CategoryInitial) {
                        return true;
                      }

                      if (current is CategoriesState) {
                        return true;
                      }

                      if (current is ErrorCategoriesState) {
                        return true;
                      }

                      return false;
                    },
                    builder: (context, state) {
                      if (state is CategoryInitial) {
                        return Center(child: CircularProgressIndicator());
                      }

                      if (state is CategoriesState) {
                        return Expanded(
                          child: GridView.builder(
                            itemCount: 10,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 1 / 0.8,
                                  crossAxisSpacing: 8,
                                  mainAxisSpacing: 8,
                                ),
                            itemBuilder: (context, index) {
                              return Card(
                                color: Colors.amber,
                                child: Center(
                                  child: Text(state.categories[index].name),
                                ),
                              );
                            },
                          ),
                        );
                      }
                      return SizedBox.shrink();
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
