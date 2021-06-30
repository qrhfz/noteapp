import 'package:moor/moor.dart';

class Notes extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get body => text()();
  IntColumn get category => integer().nullable()();
}
