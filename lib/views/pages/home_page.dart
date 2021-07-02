import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noteapp/controllers/home_page_controller.dart';
import 'package:noteapp/services/moor_service.dart';
import 'package:noteapp/views/pages/note_page.dart';
import 'package:noteapp/views/widgets/note_list_tile.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final HomePageController controller = Get.put(HomePageController());
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Builder(
        builder: (BuildContext context) => Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [Tab(text: 'Semua Note'), Tab(text: 'Kategori')],
            ),
            title: const Text('Notes'),
          ),
          body: TabBarView(children: [
            StreamBuilder(
              stream: controller.getAllNote(),
              builder:
                  (BuildContext context, AsyncSnapshot<List<Note>> snapshot) {
                if (snapshot.hasData) {
                  final data = snapshot.data;
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      final title = data![index].title;
                      final body = data[index].body;
                      final id = data[index].id;
                      return GestureDetector(
                          onTap: () => Get.to(() => NotePage(), arguments: id),
                          child: NoteListTile(
                            title: title,
                            body: body,
                            id: id,
                          ));
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
            const Center(
              child: Text('Kategori'),
            )
          ]),
          floatingActionButton: FloatingActionButton(
            // onPressed: () => Get.to(() => NotePage()),
            onPressed: () => Get.snackbar(
                'alert', DefaultTabController.of(context)!.index.toString()),
            child: const Icon(Icons.create),
          ),
        ),
      ),
    );
  }
}
