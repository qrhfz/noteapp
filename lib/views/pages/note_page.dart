import 'package:flutter/material.dart';

class NotePage extends StatelessWidget {
  const NotePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View Note'),
      ),
      // bottomSheet: Row(
      //   children: [IconButton(onPressed: () {}, icon: Icon(Icons.attach_file))],
      // ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // CategoryIcon(iconIndex: 0, colorIndex: 0),
                  TextButton(
                    onPressed: () {},
                    child: const Text('No Category'),
                  ),
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.attach_file))
                ],
              ),
              const TextField(
                decoration: InputDecoration(hintText: 'Judul'),
              ),
              const SizedBox(height: 16),
              const TextField(
                minLines: 10,
                maxLines: null,
                decoration: InputDecoration(hintText: 'Isi'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
