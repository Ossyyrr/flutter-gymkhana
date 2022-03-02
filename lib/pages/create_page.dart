import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:scanqr/pages/widgets/custom_qr_image.dart';

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
            height: MediaQuery.of(context).size.height / 2,
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
          CustomQrImage(
            data: _latLngConverter(),
          ),
        ],
      )),
    );
  }

  String _latLngConverter() {
    final lat = currentLatLng.latitude;
    final lng = currentLatLng.longitude;
    final geoString = 'geo:' + lat.toString() + ',' + lng.toString();
    log(geoString);
    return geoString;
  }

  void _handleTap(LatLng point) {
    _markers.clear();
    _markers.add(Marker(
      markerId: MarkerId(point.toString()),
      position: point,
      infoWindow: const InfoWindow(
        title: 'I am a marker',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueMagenta),
    ));
    currentLatLng = point;
    setState(() {});
  }
}
