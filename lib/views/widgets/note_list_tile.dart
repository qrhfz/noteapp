import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:noteapp/consts/category_styles.dart';
import 'package:noteapp/controllers/pages/home_page_controller.dart';
import 'package:noteapp/models/note_with_category.dart';
import 'package:noteapp/services/moor_service.dart';
import 'package:noteapp/utils/myhelper.dart';
import 'package:noteapp/views/pages/note_page.dart';

class NoteListTile extends StatelessWidget {
  NoteListTile(this.noteWithCategory, {Key? key}) : super(key: key);
  final HomePageController _homePageController = Get.find();
  final NoteWithCategory noteWithCategory;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: const SlidableDrawerActionPane(),
      // actionExtentRatio: 0.25,
      actions: [
        IconSlideAction(
            caption: 'Delete',
            color: Colors.red,
            icon: Icons.delete,
            onTap: () =>
                _homePageController.deleteNote(noteWithCategory.note.id)),
      ],

      secondaryActions: [
        IconSlideAction(
            caption: 'Pin',
            color: Colors.yellow,
            icon: Icons.push_pin_outlined,
            onTap: () => _homePageController.togglePin(noteWithCategory.note))
      ],

      child: Card(
        child: ListTile(
          // tileColor: CategoryIconStyle.noteCategoryColors['DANGER'],
          leading: noteWithCategory.category != null
              ? Icon(
                  CategoryIconStyle
                      .noteCategoryIcons[noteWithCategory.category!.icon],
                  color: CategoryIconStyle
                      .noteCategoryColors[noteWithCategory.category!.color],
                  size: 32,
                )
              : null,
          title: Text(noteWithCategory.note.title.isNotEmpty
              ? noteWithCategory.note.title
              : 'Tanpa Judul'),
          subtitle: Text(MyHelper.truncate(noteWithCategory.note.body, 45)),
          trailing:
              noteWithCategory.note.pinned ? const Icon(Icons.push_pin) : null,
          onTap: () =>
              Get.to(() => NotePage(), arguments: noteWithCategory.note.id),
        ),
      ),
    );
  }
}
