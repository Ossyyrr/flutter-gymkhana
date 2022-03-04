import 'package:flutter/material.dart';
import 'package:scanqr/pages/widgets/scan_tiles.dart';
import 'package:share_plus/share_plus.dart';

class MapasPage extends StatelessWidget {
  const MapasPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Expanded(
          child: ScanTiles(),
        ),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: ElevatedButton(
              onPressed: () {
                Share.share('check out my website https://example.com', subject: 'Look what I made!');
              },
              child: const Text('share')),
        )
      ],
    );
  }
}
