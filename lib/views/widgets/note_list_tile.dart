import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:noteapp/consts/category_styles.dart';
import 'package:noteapp/controllers/pages/home_page_controller.dart';
import 'package:noteapp/models/note_with_category.dart';
import 'package:noteapp/utils/myhelper.dart';
import 'package:noteapp/views/pages/note_page.dart';

class NoteListTile extends StatelessWidget {
  NoteListTile(this.noteWithCategory, {Key? key}) : super(key: key);
  final HomePageController _homePageController = Get.find();
  final NoteWithCategory noteWithCategory;

  @override
  Widget build(BuildContext context) {
    final id = noteWithCategory.note.id;
    return Card(
      child: Obx(
        () => ListTile(
          leading: _buildTileLeading(id),
          title: Text(noteWithCategory.note.title.isNotEmpty
              ? noteWithCategory.note.title
              : 'Tanpa Judul'),
          subtitle: Text(MyHelper.truncate(noteWithCategory.note.body, 45)),
          trailing:
              noteWithCategory.note.pinned ? const Icon(Icons.push_pin) : null,
          onTap: () {
            if (_homePageController.selectedIds.isEmpty) {
              Get.to(() => NotePage(), arguments: id);
            } else {
              _homePageController.toggleSelected(id);
            }
          },
          onLongPress: () {
            _homePageController.toggleSelected(id);
          },
          selectedTileColor: Colors.grey.shade300,
          selected: _homePageController.isSelected(id),
        ),
      ),
    );
  }

  Widget? _buildTileLeading(int id) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (_homePageController.isSelected(id)) const Icon(Icons.check_box),
        if (noteWithCategory.category != null)
          Icon(
            CategoryIconStyle
                .noteCategoryIcons[noteWithCategory.category!.icon],
            color: CategoryIconStyle
                .noteCategoryColors[noteWithCategory.category!.color],
            size: 32,
          ),
      ],
    );
  }
}
