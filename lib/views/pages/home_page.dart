import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noteapp/controllers/note_controller.dart';
import 'package:noteapp/services/moor_service.dart';
import 'package:noteapp/utils/myhelper.dart';
import 'package:noteapp/views/pages/note_page.dart';
import 'package:noteapp/views/widgets/category_icon.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final NoteController noteController = Get.put(NoteController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
      ),
      body: Center(
        child: StreamBuilder(
          stream: noteController.getAllNote(),
          builder: (BuildContext context, AsyncSnapshot<List<Note>> snapshot) {
            if (snapshot.hasData) {
              final data = snapshot.data;
              return ListView.builder(
                itemBuilder: (context, index) {
                  final title = data![index].title;
                  final body = data[index].body;
                  final id = data[index].id;
                  return GestureDetector(
                      onTap: () => Get.to(() => NotePage(), arguments: id),
                      child: NoteListTile(title: title, body: body));
                },
                itemCount: data!.length,
              );
            } else if (snapshot.hasError) {
              return const Text('error');
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => NotePage()),
        child: const Icon(Icons.create),
      ),
    );
  }
}

class NoteListTile extends StatelessWidget {
  const NoteListTile({
    Key? key,
    required this.title,
    required this.body,
  }) : super(key: key);

  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title.isEmpty ? 'Empty title' : title),
      subtitle: Text(MyHelper.truncate(body, 48)),
      leading: const CategoryIcon(
        iconIndex: 0,
        colorIndex: 0,
      ),
    );
  }
}
