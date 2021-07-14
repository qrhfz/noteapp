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

  Future<void> togglePin(Note entry) async {
    return db.updateNote(entry.copyWith(pinned: !entry.pinned));
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
