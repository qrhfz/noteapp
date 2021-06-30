// These imports are only needed to open the database
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

  Stream<List<Note>> get allNoteEntries => select(notes).watch();

  Future<Note> getNoteEntry(int id) {
    return (select(notes)..where((tbl) => tbl.id.equals(id))).getSingle();
  }

  Future addNote(NotesCompanion entry) {
    return into(notes).insert(entry);
  }

  Future updateNote(NotesCompanion entry) {
    return update(notes).replace(entry);
  }

  Future<void> createOrUpdateNote(Note note) {
    return into(notes).insertOnConflictUpdate(note);
  }
}
