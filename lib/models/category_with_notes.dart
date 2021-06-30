import 'package:noteapp/models/category_model.dart';
import 'package:noteapp/models/note_model.dart';

class CategoryWithNotes {
  final Category category;
  final List<Note>? notes;

  CategoryWithNotes({required this.category, this.notes});
}
