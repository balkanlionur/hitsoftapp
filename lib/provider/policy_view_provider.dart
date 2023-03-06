import 'package:sqflite/sqflite.dart';

import '../model/policy_model.dart';
import '../model/user_model.dart';

class PolicyDatabseProvider {
  final String _userDatabaseName = "onurr9";
  final String _userTableName = "onurr9";
  final int _version = 1;
  late Database database;

  String columnId = "docnum";
  String cpolicyDate = "policyDate";
  String cday = "day";

  String cdailyPrice = "dailyPrice";
  String cmonthlyPrice = "monthlyPrice";

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
      '''CREATE TABLE $_userTableName ($columnId INTEGER,
          $cpolicyDate VARCHAR(20),
          $cday INTEGER,
          $cdailyPrice INTEGER,
          $cmonthlyPrice INTEGER)
          ''',
    );
  }

  Future<List<PolicyModel>> getList() async {
    List<Map> userMaps = await database.query(_userTableName);

    return userMaps.map((e) => PolicyModel.fromJson(e)).toList();
  }

  Future<PolicyModel?> getItem(int id) async {
    if (database != null) open();
    final userMaps = await database.query(
      _userTableName,
      where: '$columnId = ?',
      columns: [columnId],
      whereArgs: [id],
    );

    if (userMaps.isNotEmpty) {
      return PolicyModel.fromJson(userMaps.first);
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

  Future<bool?> insert(PolicyModel model) async {
    if (database != null) open();
    final userMaps = await database.insert(
      _userTableName,
      model.toJson(),
    );

    return userMaps != null;
  }

  Future<bool?> update(int id, PolicyModel model) async {
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
