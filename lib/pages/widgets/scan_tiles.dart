import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scanqr/providers/scan_list_provider.dart';
import 'package:scanqr/utils/utils.dart';

class ScanTiles extends StatelessWidget {
  const ScanTiles({Key? key, required this.tipo}) : super(key: key);
  final String tipo;

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context);
    final scans = scanListProvider.scans;
    log('LONGITUD: ' + scans.length.toString());
    if (scans.isEmpty) {
      return const Center(
          child: Text(
        'Escanea algo para comenzar.',
        style: TextStyle(color: Colors.grey),
      ));
    }

    return ListView.builder(
        itemCount: scans.length,
        itemBuilder: (_, i) {
          return Dismissible(
            key: UniqueKey(),
            background: Container(color: Colors.redAccent),
            onDismissed: (DismissDirection direction) {
              scanListProvider.borrarScanPorId(scans[i].id!);
            },
            child: ListTile(
              leading: Icon(
                tipo == 'http' ? Icons.home_outlined : Icons.map,
                color: Theme.of(context).primaryColor,
              ),
              title: Text(scans[i].valor.title),
              subtitle: Text(scans[i].valor.description),
              trailing: const Icon(
                Icons.keyboard_arrow_right,
                color: Colors.grey,
              ),
              onTap: () {
                //    print(scans[i].id.toString());
                launchURL(context, scans[i]);
              },
            ),
          );
        });
  }
}
