import 'package:flutter_app/db/helper/auth/authhelper.dart';

class LoginHelper {
  Future<bool> checkLogin(String username, String password) async {
    final db = await AuthHelper().database;
    List<Map<String, dynamic>> result = await db.query(
      'users',
      where: 'username = ?',
      whereArgs: [username],
    );
    if (result.isNotEmpty) {
      // Assuming passwords are stored as plaintext (not recommended)
      // This is just a basic example and NOT secure
      return result.first['password'] == password;
    } else {
      return false;
    }
  }
}
