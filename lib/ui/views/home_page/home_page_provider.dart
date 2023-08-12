import 'package:flutter/material.dart';
import 'package:note_app/app/app.dart';
import 'package:note_app/app/router.dart';
import 'package:note_app/core/services/database_service.dart';
import 'package:note_app/core/services/navigation_service.dart';

class HomePageProvider with ChangeNotifier {
  final db = getIt<DataBaseService>();
  final navigation = getIt<NavigationService>();
  List<Map<String, dynamic>> pinnedNotes = [];
  List<Map<String, dynamic>> otherNotes = [];

  Future<void> getNotes() async {
    final notes = await db.selectAllNotes();
    pinnedNotes = notes
        .where(
          (element) => element["isPinned"] == 1 && element["isDeleted"] == 0,
        )
        .toList();
    otherNotes = notes
        .where(
          (element) => element["isPinned"] == 0 && element["isDeleted"] == 0,
        )
        .toList();

    debugPrint("$notes");
    notifyListeners();
  }

 
 

  void navigateToAddNew() => navigation.pushNamed(Routes.addNotes);
  void navigateToHome() => navigation.pushNamed(Routes.homePage);
  void navigateToFavourites() => navigation.pushNamed(Routes.favourites);
  void navigateToDelete() => navigation.pushNamed(Routes.delete);
}
