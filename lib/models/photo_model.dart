import 'package:moor/moor.dart';

class Photo extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get path => text()();
}
