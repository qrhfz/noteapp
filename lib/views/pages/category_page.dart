import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noteapp/views/dialogs/add_category_dialog.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Atur Kategori'),
        actions: [
          IconButton(
              onPressed: () => Get.dialog(AddCategoryDialog()),
              icon: const Icon(Icons.add))
        ],
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 120,
            childAspectRatio: 1,
            mainAxisSpacing: 0,
            crossAxisSpacing: 0),
        itemCount: 20,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: Card(
              child: Center(child: Text(index.toString())),
            ),
          );
        },
      ),
    );
  }
}
