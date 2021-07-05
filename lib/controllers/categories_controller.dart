import 'package:get/get.dart' as g;
import 'package:moor/moor.dart';
import 'package:noteapp/services/moor_service.dart';

class CategoriesController {
  final MyDatabase db = g.Get.find();

  void addCategory(String name, String? icon, String? color) {
    db.addCategory(CategoriesCompanion(
        name: Value(name), icon: Value(icon), color: Value(color)));
  }

  Stream<List<Category>> getAllCategory() => db.allCategoryEntries;
}
