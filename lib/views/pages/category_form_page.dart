import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noteapp/consts/category_styles.dart';
import 'package:noteapp/controllers/pages/category_form_controller.dart';

class CategoryForm extends StatelessWidget {
  CategoryForm({Key? key}) : super(key: key);
  final _controller = Get.put(CategoryFormController());
  final TextEditingController _namaKategori = TextEditingController();

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
                onChanged: (value) => _controller.name.value = value,
                decoration: const InputDecoration(hintText: 'Nama Kategory'),
              ),
              const SizedBox(
                height: 8,
              ),
              Text('Icon', style: Theme.of(context).textTheme.headline6),
              Obx(() => _selectIcon()),
              Text('Warna', style: Theme.of(context).textTheme.headline6),
              Obx(() => _selectColor()),
              ElevatedButton(
                  onPressed: () {
                    _controller.add();
                    Get.back();
                  },
                  child: const Text('Tambah'))
            ],
          )),
    );
  }

  Wrap _selectColor() {
    return Wrap(
      children: CategoryIconStyle.noteCategoryColors.entries
          .map((color) => ChoiceChip(
                avatar: Container(
                  color: color.value,
                  width: 16,
                  height: 16,
                ),
                label: Text(color.key),
                selected: _controller.selectedColor.value == color.key,
                onSelected: (selected) {
                  _controller.selectedColor.value = color.key;
                },
              ))
          .toList(),
    );
  }

  Wrap _selectIcon() {
    return Wrap(
      children: CategoryIconStyle.noteCategoryIcons.entries
          .map(
            (icon) => ChoiceChip(
              avatar: Icon(icon.value),
              label: Text(icon.key),
              selected: _controller.selectedIcon.value == icon.key,
              onSelected: (selected) {
                _controller.selectedIcon.value = icon.key;
              },
            ),
          )
          .toList(),
    );
  }
}
