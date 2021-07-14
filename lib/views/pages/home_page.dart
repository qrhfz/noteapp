import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noteapp/controllers/pages/home_page_controller.dart';
import 'package:noteapp/models/note_with_category.dart';
import 'package:noteapp/utils/note_search_delegate.dart';
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
        actions: [
          _buildActions(),
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: NoteSearchDelegate());
              },
              icon: const Icon(Icons.search)),
        ],
      ),
      body: _buildNoteList(),
      drawer: AppDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => NotePage()),
        child: const Icon(Icons.create),
      ),
    );
  }

  Widget _buildNoteList() {
    return StreamBuilder(
      stream: _controller.getAllNote(),
      builder: (BuildContext context,
          AsyncSnapshot<List<NoteWithCategory>> snapshot) {
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

  ListView _buildNoteListSuccess(List<NoteWithCategory> notes) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return NoteListTile(notes[index]);
      },
      itemCount: notes.length,
    );
  }

  Widget _buildActions() {
    return Obx(() {
      if (_controller.selectedIds.isNotEmpty) {
        return Row(
          children: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.delete)),
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.push_pin_rounded))
          ],
        );
      }
      return const SizedBox.shrink();
    });
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
        children: const [
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
