import 'package:flutter_app/db/helper/auth/authhelper.dart';
import 'package:sqflite/sqlite_api.dart';

class RegistrationHelper {
  Future<void> registerUser(String username, String password) async {
    final db = await AuthHelper().database;
    await db.insert(
      'users',
      {
        'username': username,
        'password': password,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<bool> checkUsernameExists(String username) async {
    final db = await AuthHelper().database;
    List<Map<String, dynamic>> result = await db.query(
      'users',
      where: 'username = ?',
      whereArgs: [username],
    );
    return result.isNotEmpty;
  }
}
