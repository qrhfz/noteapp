import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noteapp/consts/category_styles.dart';
import 'package:noteapp/controllers/categories_controller.dart';
import 'package:noteapp/controllers/pages/category_form_controller.dart';

class CategoryForm extends StatelessWidget {
  CategoryForm({Key? key}) : super(key: key);
  final c = Get.put(CategoryFormController());
  final TextEditingController _namaKategori = TextEditingController();
  final CategoriesController _categoriesController =
      Get.put(CategoriesController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Tambah Kategori'),
      ),
      body: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _namaKategori,
                decoration: const InputDecoration(hintText: 'Nama Kategory'),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'Icon',
                style: Theme.of(context).textTheme.headline6,
              ),
              Obx(
                () => Wrap(
                  children: CategoryIconStyle.noteCategoryIcons.entries
                      .map(
                        (e) => ChoiceChip(
                          avatar: Icon(e.value),
                          label: Text(e.key),
                          selected: c.selectedIcon.value == e.key,
                          onSelected: (selected) {
                            c.selectedIcon.value = e.key;
                          },
                        ),
                      )
                      .toList(),
                ),
              ),
              Text(
                'Warna',
                style: Theme.of(context).textTheme.headline6,
              ),
              Obx(
                () => Wrap(
                  children: CategoryIconStyle.noteCategoryColors.entries
                      .map((e) => ChoiceChip(
                            avatar: Container(
                              color: e.value,
                              width: 16,
                              height: 16,
                            ),
                            label: Text(e.key),
                            selected: c.selectedColor.value == e.key,
                            onSelected: (selected) {
                              c.selectedColor.value = e.key;
                            },
                          ))
                      .toList(),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    _categoriesController.addCategory(_namaKategori.text,
                        c.selectedIcon.value, c.selectedColor.value);
                    Get.back();
                  },
                  child: const Text('Tambah'))
            ],
          )),
    );
  }
}
