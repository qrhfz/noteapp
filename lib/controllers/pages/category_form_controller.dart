import 'package:get/get.dart';

import '../categories_controller.dart';

class CategoryFormController extends GetxController {
  final CategoriesController _categoriesController =
      Get.put(CategoriesController());
  RxString selectedColor = ''.obs;
  RxString selectedIcon = ''.obs;
  RxString name = ''.obs;

  void add() {
    _categoriesController.addCategory(
        name.value, selectedIcon.value, selectedColor.value);
    Get.back();
  }
}
