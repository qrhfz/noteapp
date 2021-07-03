import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        DrawerHeader(child: Container()),
        Expanded(
          child: ListView.builder(
              itemCount: 12,
              itemBuilder: (ctx, index) {
                return const ListTile(
                  leading: Icon(Icons.favorite),
                  title: Text('Kategori'),
                );
              }),
        ),
      ]),
    );
  }
}
