import 'package:flutter/material.dart';
import 'package:note_app/app/app.dart';
import 'package:note_app/app/router.dart';
import 'package:note_app/core/services/database_service.dart';
import 'package:note_app/core/services/navigation_service.dart';

class FavouriteViewProvider with ChangeNotifier {
  final db = getIt<DataBaseService>();
  final navigation = getIt<NavigationService>();
  List<Map<String, dynamic>> favouriteNotes = [];
  

  Future<void> getNotes() async {
    final notes = await db.selectAllNotes();
    favouriteNotes = notes
        .where(
          (element) => element["isFavourite"] == 1,
        )
        .toList();
  
    notifyListeners();
  }

  void navigateToAddNew() => navigation.pushNamed(Routes.addNotes);
  void navigateToHome() => navigation.pushNamed(Routes.homePage);
}
