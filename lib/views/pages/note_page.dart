import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noteapp/controllers/pages/note_page_controller.dart';

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
                return _buildTextFieldTitle();
              }),
              const SizedBox(height: 8),
              Obx(() {
                _bodyTextController.text = controller.body.value;
                return _buildTextFieldBody();
              }),
            ],
          ),
        ),
      ),
    );
  }

  TextField _buildTextFieldTitle() {
    return TextField(
      controller: _titleTextController,
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
