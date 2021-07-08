import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noteapp/consts/category_styles.dart';
import 'package:noteapp/controllers/categories_controller.dart';
import 'package:noteapp/controllers/pages/note_page_controller.dart';
import 'package:noteapp/services/moor_service.dart';

class NotePage extends StatelessWidget {
  NotePage({Key? key}) : super(key: key);
  final _titleTextController = TextEditingController();
  final _bodyTextController = TextEditingController();

  final controller = Get.put(NotePageController());
  final CategoriesController _categoriesController = Get.find();
  final int? _id = Get.arguments as int?;
  @override
  Widget build(BuildContext context) {
    if (_id != null) {
      controller.setId(_id!);
      controller.getNoteContent();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('View Note'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: GetBuilder<NotePageController>(
            init: controller,
            builder: (value) {
              _titleTextController.text = controller.note.value.title;
              _bodyTextController.text = controller.note.value.body;
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildCategoryDropdownButton(),
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.attach_file))
                    ],
                  ),
                  _buildTextFieldTitle(),
                  const SizedBox(height: 8),
                  _buildTextFieldBody(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryDropdownButton() => FutureBuilder<List<Category>>(
      future: _categoriesController.getCategories(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final data = snapshot.data;
          return Obx(
            () => DropdownButton<int>(
              value: controller.selectedCategoryId.value,
              hint: const Text('Kategori'),
              onChanged: (value) =>
                  controller.selectedCategoryId.value = value!,
              items: data!
                  .map(
                    (e) => DropdownMenuItem<int>(
                        value: e.id,
                        child: Row(
                          children: [
                            Icon(CategoryIconStyle.noteCategoryIcons[e.icon]),
                            Text(e.name)
                          ],
                        )),
                  )
                  .toList()
                    ..add(
                      const DropdownMenuItem<int>(
                          value: 0, child: Text('Tanpa Kategori')),
                    ),
            ),
          );
        } else {
          return const Text('Tanpa Kategori');
        }
      });

  TextField _buildTextFieldTitle() {
    return TextField(
      controller: _titleTextController,
      onChanged: (_) => controller.setTitle(_titleTextController.text),
      decoration: InputDecoration(
        hintText: 'Judul',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          // borderSide: BorderSide(),
        ),
      ),
    );
  }

  TextField _buildTextFieldBody() {
    return TextField(
      controller: _bodyTextController,
      onChanged: (_) => controller.setBody(_bodyTextController.text),
      minLines: 10,
      maxLines: null,
      decoration: InputDecoration(
        hintText: 'Isi',
        alignLabelWithHint: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          // borderSide: const BorderSide(),
        ),
      ),
    );
  }
}
