import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scanqr/providers/scan_list_provider.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: const Text('Historial'),
      actions: [
        IconButton(
          onPressed: () {
            Provider.of<ScanListProvider>(context, listen: false).borrarTodos();
          },
          icon: const Icon(Icons.delete_forever),
        ),
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, 'create');
          },
          icon: const Icon(Icons.add_box_outlined),
        ),
      ],
    );
  }
}
