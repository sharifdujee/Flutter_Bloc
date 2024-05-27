
import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPolyGoneScreen extends StatefulWidget {
  const MapPolyGoneScreen({super.key});

  @override
  State<MapPolyGoneScreen> createState() => _MapPolyGoneScreenState();
}

class _MapPolyGoneScreenState extends State<MapPolyGoneScreen> {
  Completer<GoogleMapController> _controller = Completer();
  CameraPosition _KCooglePlex = CameraPosition(target: LatLng(33.654235, 73.07300),
    zoom: 14
  );
  final Set<Marker> _marker = {};
  Set<Polygon> _polygon = HashSet<Polygon>();
  List<LatLng> points = [
    LatLng(33.654235, 73.07300),
    LatLng(33.647326, 72.020175),
    LatLng(34.131452, 72.662334),
    LatLng(33.654235, 73.07300),
    // start and end point is same

  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _polygon.add(Polygon(polygonId: PolygonId('1'), points: points,
    fillColor: Colors.red.withOpacity(0.3),
    geodesic: true,
    strokeWidth: 4,
    strokeColor: Colors.deepOrange));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Polygone'),
      ),
      body: GoogleMap(initialCameraPosition: _KCooglePlex,
      mapType: MapType.normal,
      myLocationEnabled: false,
      myLocationButtonEnabled: true,
      polygons: _polygon,
      onMapCreated: (GoogleMapController controller){
        _controller.complete(controller);
      },),
    );
  }
}
