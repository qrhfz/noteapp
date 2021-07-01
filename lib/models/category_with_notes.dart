import 'package:noteapp/services/moor_service.dart';

class CategoryWithNotes {
  final Category category;
  final List<Note>? notes;

  CategoryWithNotes({required this.category, this.notes});
}
