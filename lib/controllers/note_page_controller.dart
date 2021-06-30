import 'package:get/get.dart';
import 'package:noteapp/services/moor_service.dart';

import 'note_controller.dart';

class NotePageController extends GetxController {
  final NoteController noteController = Get.find();
  RxInt id = 0.obs;
  RxString title = ''.obs;
  RxString body = ''.obs;

  Future<void> getNoteContent() async {
    final Note note = await noteController.getNoteById(id.value);
    title.value = note.title;
    body.value = note.body;
  }
}
