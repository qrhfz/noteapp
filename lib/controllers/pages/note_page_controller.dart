import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noteapp/services/moor_service.dart';
import 'package:moor/moor.dart' as m;

import '../categories_controller.dart';

class NotePageController extends GetxController {
  MyDatabase db = Get.find();
  final CategoriesController _categoriesController = Get.find();
  Rx<Note> note = Note(id: 0, title: '', body: '', pinned: false).obs;
  List<Category> categories = [];
  final titleText = TextEditingController();
  final bodyText = TextEditingController();
  String? titleSnapshot;
  String? bodySnapshot;

  NotePageController() {
    getCategories();
  }

  void setSelectedCategoryId(int id) {
    note.value = note.value.copyWith(category: id);
    update();
    saveNote();
  }

  Future<void> getCategories() async {
    try {
      categories = await _categoriesController.getCategories();
      update();
    } on Exception catch (_) {
      // TODO
    }
  }

  Future<void> getNoteContent() async {
    try {
      note.value = await db.getNoteEntry(note.value.id);

      titleText.text = titleSnapshot = note.value.title;
      bodyText.text = bodySnapshot = note.value.body;
      update();
    } on Exception catch (_) {
      // TODO
    }
  }

  bool isChanged() {
    print('JUDUL SNAP $titleSnapshot');
    print('BODY SNAP $bodySnapshot');
    return titleText.text != titleSnapshot || bodyText.text != bodySnapshot;
  }

  Future<void> saveNote() async {
    log('ID: ${note.value.id}');
    if (note.value.id != 0) {
      log('SAVE NOTE: UPDATE');
      db.updateNote(note.value);
    } else {
      log('SAVE NOTE: SAVE ');

      final int id = await db.addNote(
        NotesCompanion(
          body: m.Value(note.value.body),
          title: m.Value(note.value.title),
          category: m.Value(note.value.category),
        ),
      );
      setId(id);
    }
    getNoteContent();
  }

  void setId(int id) {
    log('ID: $id');
    note.value = note.value.copyWith(id: id);
  }

  void setTitle(String text) {
    log('SET TITLE');
    note.value = note.value.copyWith(title: text);
  }

  void setBody(String text) {
    log('SET Body');
    note.value = note.value.copyWith(body: text);
  }
}
