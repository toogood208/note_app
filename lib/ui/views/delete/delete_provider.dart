import 'package:flutter/material.dart';
import 'package:note_app/app/app.dart';
import 'package:note_app/app/router.dart';
import 'package:note_app/core/services/database_service.dart';
import 'package:note_app/core/services/navigation_service.dart';

class DeleteViewProvider
 with ChangeNotifier {
  final db = getIt<DataBaseService>();
  final navigation = getIt<NavigationService>();
  List<Map<String, dynamic>> deletedNotes = [];
  

  Future<void> getNotes() async {
    final notes = await db.getDeletdNotes();
    deletedNotes = notes
        .where(
          (element) => element["isDeleted"] == 1,
        )
        .toList();
  
    notifyListeners();
  }

  void navigateToAddNew() => navigation.pushNamed(Routes.addNotes);
  void navigateToHome() => navigation.pushNamed(Routes.homePage);
}
