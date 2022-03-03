import 'package:flutter/material.dart';
import 'package:scanqr/models/scan_model.dart';

class CreateQRProvider extends ChangeNotifier {
  String _title = '';
  String _description = '';
  // TODO Quitar required innecesarios
  ScannValueModel _scannValueModel = ScannValueModel(geo: [451, -2.555], title: 'TITULO', description: 'descripción');

  String get title {
    return _title;
  }

  set title(String text) {
    _title = text;
    _scannValueModel.title = _title;
    notifyListeners();
  }

  String get description {
    return _description;
  }

  set description(String text) {
    _description = text;
    _scannValueModel.description = _description;
    notifyListeners();
  }

  ScannValueModel get scannValueModel {
    return _scannValueModel;
  }

  set scannValueModel(ScannValueModel data) {
    _scannValueModel = data;
    notifyListeners();
  }
}
