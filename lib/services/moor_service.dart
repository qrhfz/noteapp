// These imports are only needed to open the database
import 'dart:developer';
import 'dart:io';
import 'package:moor/ffi.dart';
import 'package:noteapp/models/category_model.dart';
import 'package:noteapp/models/note_model.dart';
import 'package:noteapp/models/photo_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:moor/moor.dart';

part 'moor_service.g.dart';

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return VmDatabase(file);
  });
}

@UseMoor(tables: [Notes, Categories, Photos])
class MyDatabase extends _$MyDatabase {
  // we tell the database where to store the data with this constructor
  MyDatabase() : super(_openConnection());

  // you should bump this number whenever you change or add a table definition. Migrations
  // are covered later in this readme.
  @override
  int get schemaVersion => 1;

  // BUAT NOTE MULAI
  Stream<List<Note>> get allNoteEntries => (select(notes)
        ..orderBy([
          (n) => OrderingTerm(expression: n.pinned, mode: OrderingMode.desc)
        ]))
      .watch();

  Future<Note> getNoteEntry(int id) {
    return (select(notes)..where((tbl) => tbl.id.equals(id))).getSingle();
  }

  Future<int> addNote(NotesCompanion note) {
    return into(notes).insert(note);
  }

  Future updateNote(Note note) {
    return update(notes).replace(note);
  }

  Future<void> createOrUpdateNote(Note note) {
    return into(notes).insertOnConflictUpdate(note);
  }

  Future<void> deleteNote(int id) {
    return (delete(notes)..where((t) => t.id.equals(id))).go();
  }

  Future<List<Note>> searchNote(String searchTerm) {
    return (select(notes)
          ..where((tbl) {
            log('SEARCH');
            return tbl.body.contains(searchTerm) |
                tbl.title.contains(searchTerm);
          }))
        .get();
  }

  // BUAT NOTE SELESAI

  Future addCategory(CategoriesCompanion entry) {
    return into(categories).insert(entry);
  }

  Stream<List<Category>> get watchCategoryEntries => select(categories).watch();
  Future<List<Category>> get allCategoryEntries => select(categories).get();
}
