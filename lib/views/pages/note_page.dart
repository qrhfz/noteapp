import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noteapp/controllers/note_page_controller.dart';

class NotePage extends StatelessWidget {
  NotePage({Key? key}) : super(key: key);
  final _titleTextController = TextEditingController();
  final _bodyTextController = TextEditingController();

  final controller = Get.put(NotePageController());
  final int? _id = Get.arguments as int?;
  @override
  Widget build(BuildContext context) {
    if (_id != null) {
      controller.id.value = _id!;
      controller.getNoteContent();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('View Note'),
        actions: [
          IconButton(
            onPressed: () => controller.saveNote(
                id: _id,
                title: _titleTextController.text,
                body: _bodyTextController.text),
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // CategoryIcon(iconIndex: 0, colorIndex: 0),
                  TextButton(
                    onPressed: () {},
                    child: const Text('No Category'),
                  ),
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.attach_file))
                ],
              ),
              Obx(() {
                _titleTextController.text = controller.title.value;
                return TextField(
                  controller: _titleTextController,
                  decoration: const InputDecoration(hintText: 'Judul'),
                );
              }),
              const SizedBox(height: 16),
              Obx(() {
                _bodyTextController.text = controller.body.value;
                return TextField(
                  controller: _bodyTextController,
                  minLines: 10,
                  maxLines: null,
                  decoration: const InputDecoration(hintText: 'Isi'),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
