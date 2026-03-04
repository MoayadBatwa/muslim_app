import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Athkar Categories"), centerTitle: true),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              itemCount: 10,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1/ 0.8,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemBuilder: (context, index){
                return Card(
                  color: Colors.amber,
                  child: Center(child: Text("Category $index")),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
