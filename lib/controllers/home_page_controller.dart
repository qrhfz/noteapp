import 'package:get/get.dart';
import 'package:noteapp/services/moor_service.dart';

class HomePageController {
  MyDatabase db = Get.find();

  Stream<List<Note>> getAllNote() {
    return db.allNoteEntries;
  }

  Future<void> deleteNote(int id) async {
    await db.deleteNote(id);
  }
}
