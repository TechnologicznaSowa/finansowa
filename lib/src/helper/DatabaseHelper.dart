import 'dart:async';

import 'package:finansowa/src/helper/Dog.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  final database = _initDatabase();

  static Future<Database> _initDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), 'finansowa_database.db'),
      onCreate: _onDatabaseCreate,
      version: 1,
    );
  }

  Future<void> insertDog(Dog dog) async {
    final Database db = await database;
    await db.insert(
      'dogs',
      dog.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Dog>> dogs() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('dogs');
    return List.generate(maps.length, (i) {
      return Dog(
        id: maps[i]['id'],
        name: maps[i]['name'],
        age: maps[i]['age'],
      );
    });
  }


  static FutureOr<void> _onDatabaseCreate(Database db, int version) {
    return db.execute(
      "CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)",
    );
  }
}
