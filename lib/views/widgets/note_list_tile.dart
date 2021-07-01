import 'package:flutter/material.dart';
import 'package:noteapp/utils/myhelper.dart';
import 'package:noteapp/views/widgets/category_icon.dart';

class NoteListTile extends StatelessWidget {
  const NoteListTile({
    Key? key,
    required this.title,
    required this.body,
  }) : super(key: key);

  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title.isEmpty ? 'Empty title' : title),
      subtitle: Text(MyHelper.truncate(body, 48)),
      leading: const CategoryIcon(
        iconIndex: 0,
        colorIndex: 0,
      ),
    );
  }
}
