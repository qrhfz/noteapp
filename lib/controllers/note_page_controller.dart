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

  void saveNote({int? id, required String title, required String body}) {
    if (id != null) {
      db.updateNote(NotesCompanion(
          title: m.Value(title), body: m.Value(body), id: m.Value(id)));
    } else {
      db.addNote(NotesCompanion(title: m.Value(title), body: m.Value(body)));
    }
  }
}
