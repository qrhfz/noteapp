import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:noteapp/consts/category_styles.dart';
import 'package:noteapp/controllers/home_page_controller.dart';
import 'package:noteapp/utils/myhelper.dart';
import 'package:noteapp/views/widgets/category_icon.dart';

class NoteListTile extends StatelessWidget {
  NoteListTile(
      {Key? key,
      required this.title,
      required this.body,
      required this.id,
      this.pinned = false})
      : super(key: key);
  final HomePageController _homePageController = Get.find();
  final String title;
  final String body;
  final int id;
  final bool pinned;

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
              onTap: () => _homePageController.deleteNote(id))
        ],
        child: Card(
          child: ListTile(
            tileColor: noteCategoryColors.first,
            leading: Icon(
              noteCategoryIcons[0],
              size: 32,
            ),
            title: Text(title.isNotEmpty ? title : 'Tanpa Judul'),
            subtitle: Text(MyHelper.truncate(body, 45)),
            trailing: pinned ? Icon(Icons.push_pin) : null,
          ),
        ));
  }
}
