import 'package:get/get.dart';
import 'package:noteapp/models/note_with_category.dart';
import 'package:noteapp/services/moor_service.dart';

class HomePageController extends GetxController {
  MyDatabase db = Get.find();
  RxList<int> selectedIds = RxList();

  Stream<List<NoteWithCategory>> getAllNote() {
    return db.allNoteEntries;
  }

  Future<void> deleteNote(int id) async {
    await db.deleteNote(id);
  }

  Future<void> deleteAllNote() async {
    for (int i = 0; i < selectedIds.length; i++) {
      await deleteNote(selectedIds[i]);
    }
    selectedIds.clear();
  }

  Future<void> togglePin(int id) async {
    final note = await db.getNoteEntry(id);
    return db.updateNote(note.copyWith(pinned: !note.pinned));
  }

  Future<void> toggleAllPin() async {
    for (int i = 0; i < selectedIds.length; i++) {
      await togglePin(selectedIds[i]);
    }
  }

  bool isSelected(int id) {
    return selectedIds.contains(id);
  }

  void toggleSelected(int id) {
    if (isSelected(id)) {
      selectedIds.remove(id);
    } else {
      selectedIds.add(id);
    }
  }
}
