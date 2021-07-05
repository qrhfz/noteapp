import 'package:flutter/material.dart';

mixin CategoryIconStyle {
  static const Map<String, IconData> noteCategoryIcons = {
    'favorite': Icons.favorite,
    'star': Icons.star,
    'warning': Icons.warning,
    'info': Icons.info,
    'cek': Icons.check,
    'danger': Icons.dangerous
  };

  static final Map<String, Color> noteCategoryColors = {
    'hitam': Colors.black,
    'abu-abu': Colors.grey,
    'hijau': Colors.green,
    'teal': Colors.teal,
    'biru': Colors.blue,
    'indigo': Colors.indigo,
    'ungu': Colors.purple,
    'kuning': Colors.yellow,
    'orange': Colors.orange,
    'merah': Colors.red
  };
}
