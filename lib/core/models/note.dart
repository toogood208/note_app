
import 'package:flutter/material.dart';

class Note {
  int? id;
  String title;
  String content;
  DateTime createdDate;
  DateTime lastEditedDate;
  Color noteColor;
  int isFavourite = 0;
  int isDeleted = 0;
  int isPinned = 0;
  Note(
      {this.id,
      required this.title,
      required this.content,
      required this.createdDate,
      required this.lastEditedDate,
      required this.noteColor,
      required this.isFavourite,
      required this.isDeleted,
      required this.isPinned});

  Map<String, dynamic> toMap(bool forUpdate) {
    var data = {
      'title':title,
      'content': content,
      'createdDate': epochFromDate(createdDate),
      'lastEditedDate': epochFromDate(lastEditedDate),
      'noteColor': noteColor.value,
      'isFavourite': isFavourite,
      'isDeleted': isDeleted,
      'isPinned': isPinned,
    };
    if (forUpdate) {
      data["id"] = id!;
    }
    return data;
  }
  

  int epochFromDate(DateTime dt) {
    return dt.millisecondsSinceEpoch ~/ 1000;
  }

  void deleteNote() {
    isDeleted = 1;
  }

  void pinNote() {
    isPinned = 1;
  }

  void favouriteNote() {
    isFavourite = 1;
  }
  

  @override
  toString() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'createdDate': epochFromDate(createdDate),
      'lastEditedDatye': epochFromDate(lastEditedDate),
      'noteColor': noteColor.toString(),
      'isDeleted': isDeleted,
      'isPinned': isPinned,
      'isFavourite': isFavourite
    }.toString();
  }
}
