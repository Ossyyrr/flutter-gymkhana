import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:scanqr/providers/db_provider.dart';

class ScanListProvider extends ChangeNotifier {
  List<ScannModel> scans = [];

  Future<ScannModel> nuevoScan(String valor) async {
    log('valor: ');
    log(valor);
    final nuevoScan = ScannModel(valor: ScannValueModel.fromJson(await jsonDecode(valor)));
    final id = await DBProvider.db.nuevoScan(nuevoScan);
    // Asigno el id de la DB al modelo
    nuevoScan.id = id;
    scans.add(nuevoScan);
    notifyListeners();
    return nuevoScan;
  }

  cargarScans() async {
    final scans = await DBProvider.db.getTodosLosScans();
    this.scans = [...scans!];
    notifyListeners();
  }

  borrarTodos() async {
    await DBProvider.db.deleteAllScans();
    scans = [];
    notifyListeners();
  }

  borrarScanPorId(int id) async {
    await DBProvider.db.deleteScan(id);
    cargarScans();
  }
}
