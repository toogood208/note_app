import 'package:flutter/material.dart';
import 'package:note_app/ui/views/add_notes/add_notes.dart';
import 'package:note_app/ui/views/favourites/favourite_page_view.dart';
import 'package:note_app/ui/views/home_page/home_page_view.dart';

import '../ui/views/delete/delete_page_view.dart';

class Routes {
  static const String homePage = '/homePage';
  static const String addNotes = '/addNotes';
  static const String favourites = '/favourites';
  static const String delete = '/delete';
 

  static final routes = <String, WidgetBuilder>{
    homePage: (_) => const HomePageView(),
    addNotes: (_) => const AddNotesView(),
    favourites: (_) => const FavouritePageView(),
    delete: (_) => const DeletePageView(),
   
  };
}