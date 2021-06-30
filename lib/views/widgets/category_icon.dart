import 'package:flutter/material.dart';
import 'package:noteapp/consts/app_category_icon.dart';

class CategoryIcon extends StatelessWidget {
  const CategoryIcon({
    Key? key,
    required this.iconIndex,
    required this.colorIndex,
  }) : super(key: key);

  final int iconIndex;
  final int colorIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: Border.all(width: 2, color: Colors.white),
          color: AppCategoryIcon.colors[colorIndex]),
      child: Icon(
        AppCategoryIcon.icons[iconIndex],
        color: Colors.white,
      ),
    );
  }
}
