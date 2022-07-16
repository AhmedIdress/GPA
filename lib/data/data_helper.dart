import 'package:gpacalculate/model/gpa_model.dart';
import 'package:gpacalculate/model/semester_item_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  DatabaseHelper._();
  static DatabaseHelper instance = DatabaseHelper._();
  Database? _database;
  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    return initDb();
  }

  Future<Database> initDb() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'gpa.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
            'CREATE TABLE Gpa (id INTEGER PRIMARY KEY, hours REAL, points REAL, gpa REAL)');
        await db.execute(
            'CREATE TABLE Semester (id INTEGER PRIMARY KEY AUTOINCREMENT, credit REAL, '
                'grade text, gpaId INTEGER)');/*, FOREIGN KEY (gpaId)REFERENCES Gpa (id))*/
        _database = db;
        for (int i = 0; i < 13; i++) {
          GpaModel gpaModel = GpaModel(i, 0, 0, 0);
          insertDatabase(gpaModel);
        }
      },
    );
  }

  Future<void> insertDatabase(GpaModel gpaModel) async {
    var db = await database;
    await db.insert(
      'Gpa',
      gpaModel.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> insertSemester(SemesterItemModel semester) async {
    var db = await database;
    await db.insert(
      'Semester',
      semester.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    ).then((value) {print(value);}).catchError((error){print(error.toString());});
  }

  Future<void> updateDatabase(GpaModel gpaModel) async {
    var db = await database;
    await db.update(
      'Gpa',
      gpaModel.toJson(),
      where: 'id=?',
      whereArgs: [
        gpaModel.id,
      ],
    );
  }
  Future<void> updateSemester(SemesterItemModel semesterItemModel) async {
    var db = await database;
    await db.update(
      'Semester',
      semesterItemModel.toJson(),
      where: 'id=?',
      whereArgs: [
        semesterItemModel.id,
      ],
    );
  }

  Future<Map<String, dynamic>?> getDatabaseRow(int id) async {
    var db = await database;
    List<Map<String, dynamic>> list = await db.query(
      'Gpa',
      columns: ['id', 'hours', 'points', 'gpa'],
      where: 'id=?',
      whereArgs: [
        id,
      ],
    );
    if (list.isEmpty) {
      return null;
    } else {
      return list[0];
    }
  }

  Future<List<Map<String, dynamic>>> getAllDatabaseRows() async {
    var db = await database;

    List<Map<String, dynamic>> list = await db.query(
      'Gpa',
    );
    if (list.isEmpty) {
      return [];
    } else {
      return list;
    }
  }
  Future<List<Map<String, dynamic>>> getSemester(int gpaId) async {
    var db = await database;

    List<Map<String, dynamic>> list = await db.query(
      'Semester',
      where: 'gpaId=?',
      whereArgs: [
        gpaId,
      ],
    ).catchError((onError){print(onError.toString(),);});
    if (list.isEmpty) {
      //print('null');
      return [];
    } else {
      //print(list.length.toString()+' semester length');
      return list;
    }
  }
}
