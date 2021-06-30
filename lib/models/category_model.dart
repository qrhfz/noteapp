import 'package:moor/moor.dart';

class Category extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  IntColumn get icon => integer()();
  IntColumn get color => integer()();
}
