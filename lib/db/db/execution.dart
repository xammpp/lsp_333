// db_executions.dart
import 'package:flutter_app/db/db/db.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter_app/db/db/constant.dart';

class DBExecutions {
  static Future<void> createTables(Database db) async {
    // Create user table
    await db.execute('''
          CREATE TABLE ${DatabaseHelper.userTable} (
            ${DBConstants.columnUserId} INTEGER PRIMARY KEY AUTOINCREMENT,
            ${DBConstants.columnUsername} TEXT NOT NULL,
            ${DBConstants.columnUserPassword} TEXT NOT NULL,
            ${DBConstants.columnUserEmail} TEXT,
            ${DBConstants.columnUserPhone} TEXT
          )
          ''');

    // Create attendant table
    await db.execute('''
          CREATE TABLE ${DatabaseHelper.attendantTable} (
            ${DBConstants.columnAttentId} INTEGER PRIMARY KEY AUTOINCREMENT,
            ${DBConstants.columnAttentUsername} TEXT NOT NULL,
            ${DBConstants.columnAttentLocation} TEXT NOT NULL,
            ${DBConstants.columnAttentTimestamp} TEXT NOT NULL
          )
          ''');
  }
}
