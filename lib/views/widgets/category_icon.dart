import 'package:flutter/material.dart';
import 'package:noteapp/consts/category_styles.dart';

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
          color: noteCategoryColors[colorIndex]),
      child: Icon(
        noteCategoryIcons[iconIndex],
        color: Colors.white,
      ),
    );
  }
}
