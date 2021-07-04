import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noteapp/views/pages/category_page.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          _buildCategoryList(),
        ],
      ),
    );
  }

  Widget _buildCategoryList() {
    return Expanded(
      child: ListView.builder(
        itemCount: 12,
        itemBuilder: (ctx, index) {
          if (index == 0) {
            return _drawerHeader(ctx);
          } else if (index == 1) {
            return ListTile(
              title: const Text('Atur Kategori'),
              leading: const Icon(
                Icons.settings,
              ),
              onTap: () => Get.to(() => const CategoryPage()),
            );
          } else if (index == 2) {
            return const Divider();
          }
          return const ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Kategori'),
          );
        },
      ),
    );
  }

  DrawerHeader _drawerHeader(BuildContext ctx) {
    return DrawerHeader(
        padding: EdgeInsets.zero,
        child: Container(
          color: Theme.of(ctx).primaryColor,
          child: Stack(children: [
            Positioned(
              bottom: 8,
              left: 8,
              child: Text(
                'Selamat Datang',
                style: Theme.of(ctx).accentTextTheme.headline5,
              ),
            )
          ]),
        ));
  }
}
