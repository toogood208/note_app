import 'package:flutter/material.dart';
import 'package:note_app/app/app.dart';
import 'package:note_app/app/router.dart';
import 'package:note_app/core/models/note.dart';
import 'package:note_app/core/services/database_service.dart';
import 'package:note_app/core/services/navigation_service.dart';

class AddNotesProvider with ChangeNotifier {
  final db = getIt<DataBaseService>();
  final navigation = getIt<NavigationService>();
  List<Color> color = [
    const Color(0xfffc98ff),
    const Color(0xffff9d9d),
    const Color(0xff91f48f),
    const Color(0xff262730),
    const Color(0xfffff498)
  ];

  void addNotes(
      {required String title,
      required String content,
      required bool pinNote}) async {
    final note = Note(
        title: title,
        content: content,
        createdDate: DateTime.now(),
        lastEditedDate: DateTime.now(),
        noteColor: (color..shuffle()).first,
        isFavourite: 0,
        isDeleted: 0,
        isPinned: pinNote ? 1 : 0);
    await db.insertNote(note, true);

    await navigation.pushNamed(Routes.homePage);
  }
}
