import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class AuthHelper {
  static final AuthHelper _instance = AuthHelper._internal();

  factory AuthHelper() => _instance;

  AuthHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'app_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
          'CREATE TABLE IF NOT EXISTS users (id INTEGER PRIMARY KEY, username TEXT, password TEXT, email TEXT, phone_number TEXT)',
        );
      },
    );
  }
}
