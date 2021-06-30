import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noteapp/utils/myhelper.dart';
import 'package:noteapp/views/pages/note_page.dart';
import 'package:noteapp/views/widgets/category_icon.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: _itemBuilder,
          itemCount: 12,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => const NotePage()),
        child: const Icon(Icons.create),
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    return ListTile(
      title: Text('Test $index'),
      subtitle: Text(MyHelper.truncate(
          'h3h3 h3h3 h3h3 h3h3 h3h3 h3h3 h3h3 h3h3 h3h3 h3h3 ', 48)),
      leading: CategoryIcon(
        iconIndex: index % 6,
        colorIndex: index % 9,
      ),
    );
  }
}
