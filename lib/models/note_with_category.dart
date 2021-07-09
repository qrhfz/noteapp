import 'package:noteapp/services/moor_service.dart';

class NoteWithCategory {
  final Category? category;
  final Note note;

  NoteWithCategory(this.note, this.category);
}
