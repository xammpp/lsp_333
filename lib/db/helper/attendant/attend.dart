import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter_app/db/db/db.dart';
import 'package:flutter_app/model/attend.dart';

class AttendantHelper {
  static final AttendantHelper _instance = AttendantHelper._();
  static late Database _database;

  AttendantHelper._();

  factory AttendantHelper() => _instance;

  static Future<void> initialize() async {
    _database = await openDatabase(
      join(await getDatabasesPath(), DatabaseHelper.databaseName),
      version: DatabaseHelper.databaseVersion,
    );
  }

  Future<void> insertAttendant(Attendant attendant) async {
    await _database.insert(
      DatabaseHelper.attendantTable,
      {
        ...attendant.toMap(),
        'timestamp':
            DateTime.now().toIso8601String(), // Use current date and time
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Attendant>> getAttendants() async {
    final List<Map<String, dynamic>> maps =
        await _database.query(DatabaseHelper.attendantTable);

    return List.generate(maps.length, (i) {
      return Attendant(
        username: maps[i]['username'],
        location: maps[i]['location'],
        timestamp: DateTime.parse(maps[i]['timestamp']),
      );
    });
  }
}
