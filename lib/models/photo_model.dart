import 'package:moor/moor.dart';

class Photos extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get path => text()();
}
