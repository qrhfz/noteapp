import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noteapp/controllers/note_controller.dart';

class NotePage extends StatelessWidget {
  NotePage({Key? key}) : super(key: key);
  final _titleTextController = TextEditingController();
  final _bodyTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final NoteController controller = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text('View Note'),
        actions: [
          IconButton(
              onPressed: () => controller.saveNote(
                  _titleTextController.text, _bodyTextController.text),
              icon: const Icon(Icons.save))
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
              TextField(
                controller: _titleTextController,
                decoration: InputDecoration(hintText: 'Judul'),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _bodyTextController,
                minLines: 10,
                maxLines: null,
                decoration: InputDecoration(hintText: 'Isi'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
