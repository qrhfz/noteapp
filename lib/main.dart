import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noteapp/services/moor_service.dart';
import 'package:noteapp/views/pages/home_page.dart';

void main() {
  Get.put(MyDatabase());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
