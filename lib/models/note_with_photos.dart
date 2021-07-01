import 'package:noteapp/services/moor_service.dart';

class NoteWithPhotos {
  Note note;
  List<Photo>? photos;
  NoteWithPhotos({
    required this.note,
    this.photos,
  });
}
