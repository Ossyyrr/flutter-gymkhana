import 'package:flutter/cupertino.dart';
import 'package:scanqr/models/scan_model.dart';

void launchURL(BuildContext context, ScannModel scan) async {
  final url = scan.valor;
  // if (scan.tipo == 'http') {
  //   // Ir al sitio web
  //   if (!await launch(url)) {
  //     throw 'Could not launch $url';
  //   }
  // } else {
  Navigator.pushNamed(context, 'mapa', arguments: scan);
//  }
}
