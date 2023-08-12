import 'package:flutter/material.dart';
import 'package:note_app/app/app.dart';
import 'package:note_app/core/services/database_service.dart';
import 'package:note_app/core/services/navigation_service.dart';

class SearchProvider with ChangeNotifier {
  final db = getIt<DataBaseService>();
  final navigation = getIt<NavigationService>();
  List<Map<String, dynamic>> notes = [];

  Future<void> getNotes(String query) async {
    notes = await db.selectAllNotes();

    onSearch(query);

    debugPrint("search $notes");
    notifyListeners();
  }

  Future<void> onSearch(String query) async {
    if (notes.isNotEmpty) {
      notes = notes
          .where((element) => element["title"].toLowerCase().contains(query))
          .toList();
    } else {
      await getNotes(query);
    }
  }
}
