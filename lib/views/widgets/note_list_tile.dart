import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:noteapp/consts/category_styles.dart';
import 'package:noteapp/controllers/pages/home_page_controller.dart';
import 'package:noteapp/services/moor_service.dart';
import 'package:noteapp/utils/myhelper.dart';
import 'package:noteapp/views/pages/note_page.dart';

class NoteListTile extends StatelessWidget {
  NoteListTile({Key? key, required this.note}) : super(key: key);
  final HomePageController _homePageController = Get.find();
  final Note note;

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
            onTap: () => _homePageController.deleteNote(note.id)),
      ],

      secondaryActions: [
        IconSlideAction(
            caption: 'Pin',
            color: Colors.yellow,
            icon: Icons.push_pin_outlined,
            onTap: () => _homePageController.togglePin(note))
      ],

      child: Card(
        child: ListTile(
          // tileColor: CategoryIconStyle.noteCategoryColors['DANGER'],
          leading: Icon(
            CategoryIconStyle.noteCategoryIcons['STAR'],
            color: CategoryIconStyle.noteCategoryColors['DANGER'],
            size: 32,
          ),
          title: Text(note.title.isNotEmpty ? note.title : 'Tanpa Judul'),
          subtitle: Text(MyHelper.truncate(note.body, 45)),
          trailing: note.pinned ? const Icon(Icons.push_pin) : null,
          onTap: () => Get.to(() => NotePage(), arguments: note.id),
        ),
      ),
    );
  }
}
