import 'package:get/get.dart' as g;
import 'package:moor/moor.dart';
import 'package:noteapp/services/moor_service.dart';

class NoteController {
  MyDatabase db = g.Get.find();

  void saveNote(String title, String body) {
    db.addNote(NotesCompanion(title: Value(title), body: Value(body)));
  }

  Future<List<Note>> getAllNote() async {
    return await db.allNoteEntries;
  }
}
