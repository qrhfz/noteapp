import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noteapp/controllers/pages/note_page_controller.dart';

class NotePage extends StatelessWidget {
  NotePage({Key? key}) : super(key: key);

  final controller = Get.put(NotePageController());

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
              return Column(
                children: [
                  _categoryChoice(),
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

  Widget _categoryChoice() {
    return SizedBox(
      height: 50,
      child: ListView(
        // This next line does the trick.
        scrollDirection: Axis.horizontal,
        children: controller.categories
            .map((cat) => ChoiceChip(
                label: Text(cat.name),
                selected: controller.note.value.category == cat.id,
                onSelected: (selected) {
                  if (!selected) {
                    controller.setSelectedCategoryId(0);
                  } else {
                    controller.setSelectedCategoryId(cat.id);
                  }
                }))
            .toList(),
      ),
    );
  }

  TextField _buildTextFieldTitle() {
    return TextField(
      controller: controller.titleText,
      onChanged: (_) => controller.setTitle(controller.titleText.text),
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
      controller: controller.bodyText,
      onChanged: (_) => controller.setBody(controller.bodyText.text),
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
