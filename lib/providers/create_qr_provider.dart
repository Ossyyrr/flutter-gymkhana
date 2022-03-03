import 'package:flutter/material.dart';
import 'package:scanqr/models/scan_model.dart';

class CreateQRProvider extends ChangeNotifier {
  String _title = '';
  String _description = '';
  ScannValueModel _scannValueModel = ScannValueModel();

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
