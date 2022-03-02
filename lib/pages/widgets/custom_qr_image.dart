import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class CustomQrImage extends StatelessWidget {
  const CustomQrImage({Key? key, required this.data}) : super(key: key);
  final String data;
  @override
  Widget build(BuildContext context) {
    const qrColor = Color.fromARGB(255, 36, 36, 36);
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
        color: qrColor,
        width: 2,
      )),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          QrImage(
            data: data,
            version: QrVersions.auto,
            size: 200,
            // padding: const EdgeInsets.all(12),
            backgroundColor: const Color(0xfffafafa),
            foregroundColor: qrColor,
            eyeStyle: const QrEyeStyle(eyeShape: QrEyeShape.circle),
            dataModuleStyle: const QrDataModuleStyle(dataModuleShape: QrDataModuleShape.circle),
            gapless: false,
          ),
          const Text(
            'GymkhanaQR',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
