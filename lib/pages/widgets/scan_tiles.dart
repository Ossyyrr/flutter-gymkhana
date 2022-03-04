import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scanqr/providers/scan_list_provider.dart';

class ScanTiles extends StatelessWidget {
  const ScanTiles({Key? key}) : super(key: key);

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
                Icons.map,
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
                Navigator.pushNamed(context, 'mapa', arguments: scans[i]);
              },
            ),
          );
        });
  }
}
