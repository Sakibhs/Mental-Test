import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:mental_test_quiz/ResultModel.dart';

class DatabaseHelper{

static const _dbName = "result.db";
static const _dbVersion = 1;
//singleton class
DatabaseHelper._();
static final DatabaseHelper instance = DatabaseHelper._();

Database _database;

Future<Database> get database async{
  if (_database != null) return _database;
  _database = await _initDatabase();
  return _database;
}

_initDatabase() async{
Directory dataDirectory = await getApplicationDocumentsDirectory();
String dbPath = join(dataDirectory.path, _dbName);
return await openDatabase(dbPath, version: _dbVersion, onCreate: _onCreateDB);
}
_onCreateDB(Database db, int version) async{
  await db.execute(
    '''
    CREATE TABLE ${ResultModel.tableName}(
    ${ResultModel.colId} INTEGER PRIMARY KEY AUTOINCREMENT,
    ${ResultModel.resultName} TEXT NOT NULL,
    ${ResultModel.colStatus} INTEGER NOT NULL,
    ${ResultModel.colDate} TEXT,
    ${ResultModel.colNote} TEXT
    );
    '''
  );
}

Future<int> insertResult(ResultModel model) async{
Database db = await database;
return await db.insert(ResultModel.tableName, model.toMap());
}

Future<List<ResultModel>> fetchResults() async{
  Database db = await database;
//  List<Map> models = await db.query(ResultModel.tableName);
  List<Map> maps = await db.rawQuery("SELECT * FROM ${ResultModel.tableName}");
  List<ResultModel> results = [];
  if(maps.length>0){
    for(int i = 0; i<maps.length; i++){
      results.add(ResultModel.fromMap(maps[i]));
    }
  }

  return results;
 // return models.length == 0? [] : models.map((e) => ResultModel.fromMap(e));
}

Future<int> deleteResult(int id) async{
  Database db = await database;
  return await db.delete(ResultModel.tableName, where: '${ResultModel.colId} = ?', whereArgs: [id]);

}

}