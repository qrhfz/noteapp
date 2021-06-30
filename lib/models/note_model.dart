import 'package:moor/moor.dart';

class Note extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 6, max: 32)();
  TextColumn get body => text().named('body')();
  IntColumn get category => integer().nullable()();
}
