import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_app/screens/categoriesScreen/bloc/category_bloc.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CategoryBloc(),
      child: Builder(
        builder: (context) {
          context.read<CategoryBloc>().add(GetCategoriesEvent());

          return Scaffold(
            appBar: AppBar(
              title: Text("Athkar Categories"),
              centerTitle: true,
              backgroundColor: const Color.fromARGB(255, 96, 218, 25),
            ),

            body: Column(
              children: [
                BlocBuilder<CategoryBloc, CategoryState>(
                  buildWhen: (previous, current) {
                    if (current is CategoryInitial) {
                      return true;
                    }

                    return false;
                  },
                  builder: (context, state) {
                    return Expanded(
                      child: GridView.builder(
                        itemCount: 10,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1 / 0.8,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                        ),
                        itemBuilder: (context, index) {
                          return Card(
                            color: Colors.amber,
                            child: Center(child: Text("Category $index")),
                          );
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
