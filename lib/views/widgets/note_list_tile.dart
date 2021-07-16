import 'package:flutter/material.dart';
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
          title: Text(
            noteWithCategory.note.title.isNotEmpty
                ? noteWithCategory.note.title
                : 'Tanpa Judul',
            style: Theme.of(context).textTheme.headline6,
          ),
          subtitle: Text(
            MyHelper.truncate(noteWithCategory.note.body, 45),
            style: Theme.of(context).textTheme.bodyText2,
          ),
          trailing:
              noteWithCategory.note.pinned ? const Icon(Icons.push_pin) : null,
          onTap: () {
            //jika ada note yang dipilih maka ontap yang seharusnya membuka note menjadi toggle
            if (_homePageController.selectedIds.isEmpty) {
              Get.to(() => NotePage(), arguments: id);
            } else {
              _homePageController.toggleSelected(id);
            }
          },
          onLongPress: () {
            _homePageController.toggleSelected(id);
          },
          selectedTileColor: Colors.grey.shade200,
          selected: _homePageController.isSelected(id),
        ),
      ),
    );
  }

  Widget? _buildTileLeading(int id) {
    return SizedBox(
      height: 40,
      width: 40,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            child: (noteWithCategory.category != null)
                ? Icon(
                    CategoryIconStyle
                        .noteCategoryIcons[noteWithCategory.category!.icon],
                    color: CategoryIconStyle
                        .noteCategoryColors[noteWithCategory.category!.color],
                    size: 40,
                  )
                : Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.grey.shade300),
                  ),
          ),
          if (_homePageController.isSelected(id))
            const Positioned(
              right: 0,
              bottom: 0,
              child: Icon(
                Icons.check_box,
                size: 16,
              ),
            ),
        ],
      ),
    );
  }
}
