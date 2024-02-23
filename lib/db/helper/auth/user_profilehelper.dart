import 'package:flutter_app/db/helper/auth/authhelper.dart';

class UserProfileHelper {
  Future<void> updateUserProfile(
      String username, String email, int phoneNumber) async {
    final db = await AuthHelper().database;
    await db.update(
      'user_profile',
      {
        'username': username,
        'email': email,
        'phone_number': phoneNumber,
      },
    );
  }
}

Future<Map<String, dynamic>> getUserProfile(String username) async {
  final db = await AuthHelper().database;
  List<Map<String, dynamic>> result = await db.query(
    'users',
    where: 'username = ?',
    whereArgs: [username],
  );
  if (result.isNotEmpty) {
    return result.first;
  } else {
    return {};
  }
}
