// These imports are only needed to open the database
import 'dart:developer';
import 'dart:io';
import 'package:moor/ffi.dart';
import 'package:noteapp/models/category_model.dart';
import 'package:noteapp/models/note_model.dart';
import 'package:noteapp/models/note_with_category.dart';
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

  // UNTUK NOTE MULAI
  Stream<List<NoteWithCategory>> get allNoteEntries {
    final query = select(notes).join(
      [leftOuterJoin(categories, categories.id.equalsExp(notes.category))],
    );
    query.orderBy([OrderingTerm.desc(notes.pinned)]);

    return query.watch().map((rows) => rows
        .map((row) => NoteWithCategory(
            row.readTable(notes), row.readTableOrNull(categories)))
        .toList());
  }

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

  // UNTUK NOTE SELESAI

  Future<int> addCategory(CategoriesCompanion entry) {
    log('TAMBAH KATEGORI');
    log('ENTRY NAME : ${entry.name.value}');
    return into(categories).insert(entry);
  }

  Stream<List<Category>> get watchCategoryEntries => select(categories).watch();
  Future<List<Category>> get allCategoryEntries => select(categories).get();
  Future<void> deleteCategory(int id) {
    return (delete(categories)..where((t) => t.id.equals(id))).go();
  }
}
