import 'package:get/get.dart';
import 'package:noteapp/services/moor_service.dart';
import 'package:moor/moor.dart' as m;

class NotePageController extends GetxController {
  MyDatabase db = Get.find();

  RxInt id = 0.obs;
  RxString title = ''.obs;
  RxString body = ''.obs;

  Future<void> getNoteContent() async {
    try {
      final Note note = await db.getNoteEntry(id.value);
      title.value = note.title;
      body.value = note.body;
    } on Exception catch (_) {
      // TODO
    }
  }

  Future<void> saveNote({required String title, required String body}) async {
    if (id.value != 0) {
      return db.updateNote(NotesCompanion(
          title: m.Value(title), body: m.Value(body), id: m.Value(id.value)));
    } else {
      final id = await db
          .addNote(NotesCompanion(title: m.Value(title), body: m.Value(body)));
      this.id.value = id as int;
    }
  }
}
