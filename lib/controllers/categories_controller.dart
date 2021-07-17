import 'dart:developer';

import 'package:get/get.dart' as g;
import 'package:moor/moor.dart';
import 'package:noteapp/services/moor_service.dart';

class CategoriesController {
  final MyDatabase db = g.Get.find();

  Future<void> addCategory(String name, String? icon, String? color) async {
    final id = await db.addCategory(CategoriesCompanion(
        name: Value(name), icon: Value(icon), color: Value(color)));
    log(id.toString());
  }

  Stream<List<Category>> watchCategories() => db.watchCategoryEntries;
  Future<List<Category>> getCategories() => db.allCategoryEntries;
  Future<void> delete(int id) async {
    await db.deleteCategory(id);
  }
}
