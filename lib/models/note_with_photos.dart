import 'package:noteapp/models/photo_model.dart';
import 'package:noteapp/services/moor_service.dart';

import 'note_model.dart';

class NoteWithPhotos {
  Note note;
  List<Photo>? photos;
  NoteWithPhotos({
    required this.note,
    this.photos,
  });
}
