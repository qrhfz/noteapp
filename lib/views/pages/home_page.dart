import 'package:flutter/material.dart';
import 'package:noteapp/consts/app_category_icon.dart';
import 'package:noteapp/views/widgets/category_icon.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

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
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    return ListTile(
      title: Text('Test $index'),
      subtitle: const Text('bla bla bla'),
      leading: CategoryIcon(
        iconIndex: index % 6,
        colorIndex: index % 9,
      ),
    );
  }
}
