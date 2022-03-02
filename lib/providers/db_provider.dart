import 'dart:developer';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:scanqr/models/scan_model.dart';
import 'package:sqflite/sqflite.dart';

// Cuando llame al DBProvider también voy a usar el ScanModel,
// Al exportarlo no necesito importarlo allí donde llame al DBProvider
export 'package:scanqr/models/scan_model.dart';

class DBProvider {
  static Database? _database;
  static final DBProvider db = DBProvider._();
  DBProvider._();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }

  Future<Database> initDB() async {
    // Path donde se almacena la DB
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'ScansDB.db');
    log(path);

    // Crear DB
    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: (Database db, int version) async {
        await db.execute('''
        CREATE TABLE Scans(
          id INTEGER PRIMARY KEY,
          tipo TEXT,
          valor TEXT
        )
      ''');
      },
    );
  }

  Future<int> nuevoScanRaw(ScannModel nuevoScan) async {
    final id = nuevoScan.id;
    final tipo = nuevoScan.tipo;
    final valor = nuevoScan.valor;

    // Verificas DB
    final db = await database;
    final res = await db.rawInsert('''
    INSERT INTO Scans( id, tipo, valor )
      VALUES( $id, '$tipo', '$valor' )
    ''');
    return res;
  }

  Future<int> nuevoScan(ScannModel nuevoScan) async {
    final db = await database;
    final res = await db.insert('Scans', nuevoScan.toJson());

    // Res es el id del último registro insertado
    log(res.toString());
    return res;
  }

  Future<ScannModel?> getScanById(int id) async {
    final db = await database;
    final res = await db.query('Scans', where: 'id = ?', whereArgs: [id]);

    return res.isNotEmpty ? ScannModel.fromJson(res.first) : null;
  }

  Future<List<ScannModel>?> getTodosLosScans() async {
    final db = await database;
    final res = await db.query('Scans');

    return res.isNotEmpty ? res.map((e) => ScannModel.fromJson(e)).toList() : null;
  }

  Future<List<ScannModel>> getScansPorTipo(String tipo) async {
    final db = await database;
    final res = await db.rawQuery('''
      SELECT * FROM Scans WHERE tipo = '$tipo'
    ''');

    return res.isNotEmpty ? res.map((e) => ScannModel.fromJson(e)).toList() : [];
  }

  Future<int> updateScan(ScannModel nuevoScan) async {
    final db = await database;
    final res = await db.update('Scans', nuevoScan.toJson(), where: 'id = ?', whereArgs: [nuevoScan.id]);
    return res;
  }

  Future<int> deleteScan(int id) async {
    final db = await database;
    final res = await db.delete('Scans', where: 'id = ?', whereArgs: [id]);
    return res;
  }

  Future<int> deleteAllScans() async {
    final db = await database;
    final res = await db.delete('Scans');
    return res;
  }
}
