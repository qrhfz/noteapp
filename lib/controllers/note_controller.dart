import 'package:get/get.dart' as g;
import 'package:moor/moor.dart';
import 'package:noteapp/services/moor_service.dart';

class NoteController {
  MyDatabase db = g.Get.find();

  void saveNote({int? id, required String title, required String body}) {
    if (id != null) {
      db.updateNote(NotesCompanion(
          title: Value(title), body: Value(body), id: Value(id)));
    } else {
      db.addNote(NotesCompanion(title: Value(title), body: Value(body)));
    }
  }

  Stream<List<Note>> getAllNote() {
    return db.allNoteEntries;
  }

  Future<Note> getNoteById(int id) {
    return db.getNoteEntry(id);
  }
}
