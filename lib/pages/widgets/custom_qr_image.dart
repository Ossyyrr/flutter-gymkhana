import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:scanqr/models/scan_model.dart';

class CustomQrImage extends StatelessWidget {
  const CustomQrImage({Key? key, required this.data, required this.id}) : super(key: key);
  final ScannValueModel data;
  final String id;
  @override
  Widget build(BuildContext context) {
    log('data: ');
    log(jsonEncode(data.toJson()));
    const qrColor = Color.fromARGB(255, 36, 36, 36);
    const size = 200.0;
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(4),
          width: size + 30,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: qrColor, width: 2),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              QrImage(
                data: jsonEncode(data.toJson()),
                version: QrVersions.auto,
                size: size,
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
        ),
        Positioned(
          bottom: 0,
          right: 20,
          child: Text(
            id,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 10,
            ),
          ),
        ),
      ],
    );
  }
}
