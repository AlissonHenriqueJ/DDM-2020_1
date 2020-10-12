import 'package:atividade_appnotes/models/note.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class NotesController {
  Future<Database> init() async {
    Directory directory =
        await getApplicationDocumentsDirectory(); //returns a directory which stores permanent files
    final path = join(directory.path, "appnotes.db"); //create path to database

    return await openDatabase(
        //open the database or create a database if there isn't any
        path,
        version: 1, onCreate: (Database db, int version) async {
      await db.execute("""
          CREATE TABLE Notes (
              Title    VARCHAR (100),
              Text     VARCHAR (255),
              Arquived BOOLEAN,
              ID       INTEGER       UNIQUE
                                    NOT NULL
                                    PRIMARY KEY
          );""");
    });
  }

  Future<dynamic> getNotes() async {
    final db = await init();
    
    var res = await db.query("Notes");

    var list = res.isNotEmpty
        ? res.toList().map((note) => Note.fromMap(note)).toList()
        : List<Note>();

    return list;
  }

  Future<int> addItem(Note item) async {
    //returns number of items inserted as an integer

    final db = await init(); //open database

    return db.insert(
      "Notes",
      item.toMap(),
      conflictAlgorithm: ConflictAlgorithm.ignore,
    );
  }

  Future<int> update(Note item) async {
    final db = await init();

    int result = await db
        .update("Notes", item.toMap(), where: "ID = ?", whereArgs: [item.id]);

    return result;
  }

  Future<int> deleteNote(int id) async {
    final db = await init();
    return db.delete("Notes", where: "ID = ?", whereArgs: [id]);
  }
}
