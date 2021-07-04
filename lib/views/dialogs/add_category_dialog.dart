import 'package:flutter/material.dart';
import 'package:noteapp/consts/category_styles.dart';

class AddCategoryDialog extends StatelessWidget {
  AddCategoryDialog({
    Key? key,
  }) : super(key: key);
  final TextEditingController _namaKategori = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Tambah Kategori',
                  style: Theme.of(context).textTheme.headline5),
              TextField(
                controller: _namaKategori,
                decoration: const InputDecoration(hintText: 'Nama Kategory'),
              ),
              Row(
                children: [
                  DropdownButton(
                    hint: const Text('Icon'),
                    items: noteCategoryIcons
                        .map((icon) => DropdownMenuItem(
                            child: Icon(icon), value: icon.toString()))
                        .toList(),
                    onChanged: (_) {},
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  DropdownButton(
                    hint: const Text('Color'),
                    items: noteCategoryColors
                        .map((color) => DropdownMenuItem(
                            child: Container(
                              decoration: BoxDecoration(
                                color: color,
                                shape: BoxShape.circle,
                              ),
                              width: 16,
                              height: 26,
                            ),
                            value: color.toString()))
                        .toList(),
                    onChanged: (_) {},
                  ),
                ],
              )
            ],
          )),
    );
  }
}
