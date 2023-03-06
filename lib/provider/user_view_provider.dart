import 'package:sqflite/sqflite.dart';

import '../model/user_model.dart';

class UserDatabseProvider {
  final String _userDatabaseName = "onurr5";
  final String _userTableName = "onurr5";
  final int _version = 1;
  late Database database;

  String columnId = "docnum";
  String ccardName = "cardName";
  String ccardLastName = "cardLastName";

  String cpolciyNum = "polciyNum";
  String cpolicyBegDate = "policyBegDate";
  String cinstallmentNo = "installmentNo";

  String cpolicyEndDate = "policyEndDate";
  String ccomments = "comments";
  String cmethodology = "methodology";

  Future<void> open() async {
    database = await openDatabase(
      _userDatabaseName,
      version: _version,
      onCreate: (db, version) {
        creatTable(db);
      },
    );
  }

  Future<void> creatTable(Database db) async {
    await db.execute(
      '''CREATE TABLE $_userTableName ($columnId INTEGER PRIMARY KEY AUTOINCREMENT,
          $ccardName VARCHAR(20),
          $ccardLastName VARCHAR(20),
          $cpolciyNum INTEGER,
          $cpolicyBegDate VARCHAR(20),
          $cinstallmentNo INTEGER,
          $cpolicyEndDate VARCHAR(20),
          $ccomments VARCHAR(20),
          $cmethodology INTEGER)
          ''',
    );
  }

  Future<List<UserModel>> getList() async {
    List<Map> userMaps = await database.query(_userTableName);

    return userMaps.map((e) => UserModel.fromJson(e)).toList();
  }

  Future<UserModel?> getItem(int id) async {
    if (database != null) open();
    final userMaps = await database.query(
      _userTableName,
      where: '$columnId = ?',
      columns: [columnId],
      whereArgs: [id],
    );

    if (userMaps.isNotEmpty) {
      return UserModel.fromJson(userMaps.first);
    } else {
      return null;
    }
  }

  Future<bool?> delete(int id) async {
    if (database != null) open();
    final userMaps = await database.delete(
      _userTableName,
      where: '$columnId = ?',
      whereArgs: [id],
    );

    return userMaps != null;
  }

  Future<bool?> insert(UserModel model) async {
    if (database != null) open();
    final userMaps = await database.insert(
      _userTableName,
      model.toJson(),
    );

    return userMaps != null;
  }

  Future<bool?> update(int id, UserModel model) async {
    if (database != null) open();
    final userMaps = await database.update(
      _userTableName,
      model.toJson(),
      where: '$columnId = ?',
      whereArgs: [id],
    );

    return userMaps != null;
  }

  Future<void> close() async {
    await database.close();
  }
}
