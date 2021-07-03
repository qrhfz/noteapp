import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noteapp/controllers/home_page_controller.dart';
import 'package:noteapp/services/moor_service.dart';
import 'package:noteapp/views/pages/note_page.dart';
import 'package:noteapp/views/widgets/app_drawer.dart';
import 'package:noteapp/views/widgets/note_list_tile.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final HomePageController _controller = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: _buildNoteList(),
      drawer: AppDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => NotePage()),
        child: const Icon(Icons.create),
      ),
    );
  }

  Widget _buildCategoryView() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.builder(
        itemCount: 7,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 150, crossAxisSpacing: 8, mainAxisSpacing: 8),
        itemBuilder: (ctx, index) {
          return CategoryCard();
        },
      ),
    );
  }

  Widget _buildNoteList() {
    return StreamBuilder(
      stream: _controller.getAllNote(),
      builder: (BuildContext context, AsyncSnapshot<List<Note>> snapshot) {
        if (snapshot.hasData) {
          final data = snapshot.data;
          return _buildNoteListSuccess(data!);
        } else if (snapshot.hasError) {
          return const Text('error');
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }

  ListView _buildNoteListSuccess(List<Note> data) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final title = data[index].title;
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
      itemCount: data.length,
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            Icons.star,
            size: 36,
            color: Colors.pink,
          ),
          Text(
            'Nama Kategori',
            textAlign: TextAlign.center,
          ),
        ],
      )),
    );
  }
}
