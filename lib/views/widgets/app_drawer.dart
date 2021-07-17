import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noteapp/consts/category_styles.dart';
import 'package:noteapp/controllers/categories_controller.dart';
import 'package:noteapp/services/moor_service.dart';
import 'package:noteapp/views/pages/category_form_page.dart';

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
                itemCount: categories!.length + 3,
                itemBuilder: (ctx, index) {
                  if (index == 0) {
                    return _drawerHeader(ctx);
                  } else if (index == 1) {
                    return _addCategoryTile();
                  } else if (index == 2) {
                    return const Divider();
                  }
                  return _categoryTile(categories[index - 3]);
                },
              );
            } else {
              return Column(
                children: [
                  _drawerHeader(context),
                  _addCategoryTile(),
                ],
              );
            }
          }),
    );
  }

  ListTile _categoryTile(Category category) {
    return ListTile(
      leading: Icon(
        CategoryIconStyle.noteCategoryIcons[category.icon],
        color: CategoryIconStyle.noteCategoryColors[category.color],
      ),
      title: Text(category.name),
      trailing: InkWell(
        onTap: () async {
          await Get.dialog(CategoryMoreDialog(id: category.id));
        },
        customBorder: const CircleBorder(),
        child: Container(
          decoration: const BoxDecoration(shape: BoxShape.circle),
          child: const Icon(Icons.more_vert),
        ),
      ),
    );
  }

  ListTile _addCategoryTile() {
    return ListTile(
      title: const Text('Tambah Kategori'),
      leading: const Icon(
        Icons.add,
      ),
      onTap: () => Get.to(() => CategoryForm()),
    );
  }

  DrawerHeader _drawerHeader(BuildContext ctx) {
    return DrawerHeader(
      padding: EdgeInsets.zero,
      child: Container(
        color: Theme.of(ctx).primaryColor,
        child: Stack(
          children: [
            Positioned(
              bottom: 8,
              left: 8,
              child: Text(
                'Selamat Datang',
                style: Theme.of(ctx).accentTextTheme.headline5,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CategoryMoreDialog extends StatelessWidget {
  CategoryMoreDialog({Key? key, required this.id}) : super(key: key);
  final int id;
  final CategoriesController _categoriesController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 250,
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const ListTile(
                title: Text('Ubah'),
              ),
              ListTile(
                title: const Text('Hapus'),
                onTap: () async {
                  await _categoriesController.delete(id);
                  Get.back();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
