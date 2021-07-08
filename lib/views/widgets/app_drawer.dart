import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noteapp/consts/category_styles.dart';
import 'package:noteapp/controllers/categories_controller.dart';
import 'package:noteapp/services/moor_service.dart';
import 'package:noteapp/views/dialogs/add_category_dialog.dart';

class AppDrawer extends StatelessWidget {
  AppDrawer({
    Key? key,
  }) : super(key: key);
  final CategoriesController _categoriesController =
      Get.put(CategoriesController());
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
      child: StreamBuilder<List<Category>>(
          stream: _categoriesController.watchCategories(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final categories = snapshot.data;
              return ListView.builder(
                itemCount: categories!.length + 2,
                itemBuilder: (ctx, index) {
                  if (index == 0) {
                    return _drawerHeader(ctx);
                  } else if (index == 1) {
                    return _addCategoryTile();
                  } else if (index == 2) {
                    return const Divider();
                  }
                  return ListTile(
                    leading: Icon(
                      CategoryIconStyle
                          .noteCategoryIcons[categories[index - 2].icon],
                      color: CategoryIconStyle
                          .noteCategoryColors[categories[index - 2].color],
                    ),
                    title: Text(categories[index - 2].name),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Column(
                children: [
                  _drawerHeader(context),
                  _addCategoryTile(),
                  const ListTile(title: Text('error'))
                ],
              );
            } else {
              return Column(
                children: [
                  _drawerHeader(context),
                  _addCategoryTile(),
                  const ListTile(title: Text('Tidak ada kategori'))
                ],
              );
            }
          }),
    );
  }

  ListTile _addCategoryTile() {
    return ListTile(
      title: const Text('Tambah Kategori'),
      leading: const Icon(
        Icons.add,
      ),
      onTap: () => Get.dialog(AddCategoryDialog()),
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
