import 'package:note_app/core/models/note.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseService {
  final databaseName = 'notes.db';
  final tableName = 'notes';

  final columns = {
    "id": "INTEGER PRIMARY KEY AUTOINCREMENT",
    "title": "BLOB",
    "content": "BLOB",
    "createdDate": "INTEGER",
    "lastEditedDate": "INTEGER",
    "noteColor": "INTEGER",
    "isDeleted": "INTEGER",
    "isFavourite": "Integer",
    "isPinned": "Integer"
  };

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await initDB();
    return _database!;
  }

  initDB() async {
    var path = await getDatabasesPath();
    var dbPath = join(path, databaseName);
    Database dbConnection = await openDatabase(dbPath, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(_buildCreateQuery());
    });

    await dbConnection.execute(_buildCreateQuery());
    _buildCreateQuery();
    return dbConnection;
  }

  String _buildCreateQuery() {
    String query = "CREATE TABLE IF NOT EXISTS ";
    query += tableName;
    query += "(";
    columns.forEach((column, field) {
      query += "$column $field,";
    });

    query = query.substring(0, query.length - 1);
    query += " )";

    return query;
  }

  static Future<String> dbPath() async {
    String path = await getDatabasesPath();
    return path;
  }

  Future<int> insertNote(Note note, bool isNew) async {
    // Get a reference to the database
    final Database db = await database;

    // Insert the Notes into the correct table.
    await db.insert(
      tableName,
      isNew ? note.toMap(false) : note.toMap(true),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    if (isNew) {
      // get latest note which isn't archived, limit by 1
      var one = await db.query(tableName,
          orderBy: "lastEditedDate",
          where: "isDeleted = ?",
          whereArgs: [0],
          limit: 1);
      int latestId = one.first["id"] as int;
      return latestId;
    }
    return note.id!;
  }

  Future<bool> deleteNote(Note note) async {
    if (note.id != -1) {
      final Database db = await database;
      try {
        await db.delete(tableName, where: "id = ?", whereArgs: [note.id]);
        return true;
      } catch (e) {
        return false;
      }
    } else {
      return false;
    }
  }

  Future<bool> pinNote(Note note) async {
    if (note.id != -1) {
      final Database db = await database;

      int idToUpdate = note.id!;

      db.update(tableName, note.toMap(true),
          where: "id = ?", whereArgs: [idToUpdate]);
    }
    return false;
  }

  Future<bool> favouriteNode(Note note) async {
    if (note.id != -1) {
      final Database db = await database;

      int idToUpdate = note.id!;

      

      db.update(tableName, note.toMap(true),
          where: "id = ?", whereArgs: [idToUpdate]);
    }
    return false;
  }

   Future<bool> fakeDelete(Note note) async {
    if (note.id != -1) {
      final Database db = await database;

      int idToUpdate = note.id!;

      

      db.update(tableName, note.toMap(true),
          where: "id = ?", whereArgs: [idToUpdate]);
    }
    return false;
  }

  Future<List<Map<String, dynamic>>> selectAllNotes() async {
    final Database db = await database;
    // query all the notes sorted by last edited
    var data = await db.query("notes",
        orderBy: "lastEditedDate desc", 
         where: "isDeleted = ?",whereArgs: [0]);

    return data;
  }

  Future<List<Map<String, dynamic>>> getDeletdNotes() async {
    final Database db = await database;
    // query all the notes sorted by last edited
    var data = await db.query("notes",
        orderBy: "lastEditedDate desc", 
         where: "isDeleted = ?",whereArgs: [1]);

    return data;
  }
}
