import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPolyLineScreen extends StatefulWidget {
  const MapPolyLineScreen({super.key});

  @override
  State<MapPolyLineScreen> createState() => _MapPolyLineScreenState();
}

class _MapPolyLineScreenState extends State<MapPolyLineScreen> {
  Completer<GoogleMapController> _controller = Completer();
  CameraPosition _kGooglePlex =
      CameraPosition(target: LatLng(33.738045, 73.084488), zoom: 14);
  final Set<Marker> _markers = {};
  final Set<Polyline> _polyLine = {};
  List<LatLng> latlng = [
    LatLng(33.738045, 73.084488), // it is equal to camera position
    LatLng(33.567997728, 72.635997456)
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (int i = 0; i < latlng.length; i++) {
      _markers.add(Marker(
          markerId: MarkerId(
            i.toString(),
          ),
          position: latlng[i],
          infoWindow:
              InfoWindow(title: 'Really cool place', snippet: '5 stat rating'),
          icon: BitmapDescriptor.defaultMarker));
      setState(() {

      });
      _polyLine.add(Polyline(polylineId: PolylineId('1'),
          points: latlng,
        color: Colors.orange
      ),

      );
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PolyLine'),
      ),
      body: GoogleMap(
          markers: _markers,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
          polylines: _polyLine,
          mapType: MapType.normal,
          myLocationEnabled: true,
          initialCameraPosition: _kGooglePlex),
    );
  }
}
