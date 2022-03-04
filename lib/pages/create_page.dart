import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:scanqr/pages/widgets/custom_qr_image.dart';
import 'package:scanqr/pages/widgets/custom_text_form_field.dart';
import 'package:scanqr/providers/create_qr_provider.dart';
import 'package:scanqr/providers/scan_list_provider.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({Key? key}) : super(key: key);

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final Completer<GoogleMapController> _controller = Completer();

  final Set<Marker> _markers = <Marker>{};
  LatLng currentLatLng = const LatLng(37.43296265331129, -122.08832357078792);

  @override
  Widget build(BuildContext context) {
    final createQRProvider = Provider.of<CreateQRProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 2.4,
            child: GoogleMap(
              myLocationButtonEnabled: false,
              mapType: MapType.normal,
              markers: _markers,
              onLongPress: (latLng) {
                log(latLng.toString());
                _handleTap(latLng);
              },
              myLocationEnabled: true,
              initialCameraPosition: const CameraPosition(
                  bearing: 192.8334901395799,
                  target: LatLng(37.43296265331129, -122.08832357078792),
                  tilt: 59.440717697143555,
                  zoom: 19.151926040649414),
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(8),
              children: <Widget>[
                CustomTextFormField(
                  hintText: 'what title would you like to put?',
                  labelText: 'Title',
                  onChanged: (v) => createQRProvider.title = v,
                ),
                CustomTextFormField(
                  hintText: 'You can write a description or give a hint.',
                  labelText: 'Description',
                  onChanged: (v) => createQRProvider.description = v,
                ),
                CustomQrImage(
                  data: createQRProvider.scannValueModel,
                  id: '',
                ),
                ElevatedButton(
                  onPressed: () async {
                    log('guardar en DB');
                    final scanListProvider = Provider.of<ScanListProvider>(context, listen: false);
                    await scanListProvider.nuevoScan(jsonEncode(createQRProvider.scannValueModel));
                    Navigator.pop(context);
                  },
                  child: const Text('SAVE'),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }

  void _handleTap(LatLng point) {
    final createQRProvider = Provider.of<CreateQRProvider>(context, listen: false);

    _markers.clear();
    _markers.add(Marker(
      markerId: MarkerId(point.toString()),
      position: point,
      infoWindow: const InfoWindow(
        title: 'I am a marker',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueMagenta),
    ));
    createQRProvider.scannValueModel.geo = [point.latitude, point.longitude];

    setState(() {});
  }
}
