import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noteapp/services/moor_service.dart';
import 'package:noteapp/views/widgets/note_list_tile.dart';

class NoteSearchDelegate extends SearchDelegate<String> {
  MyDatabase db = Get.find();

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          // close(context, result);
          query = "";
        },
        icon: const Icon(Icons.close),
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        // close(context, result);
        Get.back();
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
      future: db.searchNote(query),
      builder: (BuildContext context, AsyncSnapshot<List<Note>> snapshot) {
        if (snapshot.hasData) {
          final notes = snapshot.data!;
          if (notes.isNotEmpty) {
            return _buildResultList(notes);
          } else {
            return const Center(child: Text('Tidak ditemukan'));
          }
        } else {
          return const Text('Error');
        }
      },
    );
  }

  ListView _buildResultList(List<Note> notes) {
    return ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(notes[index].title),
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
