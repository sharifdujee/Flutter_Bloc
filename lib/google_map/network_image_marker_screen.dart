import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:ui' as ui;
import 'dart:ui';
class NetworkImageMarkerScreen extends StatefulWidget {
  const NetworkImageMarkerScreen({super.key});

  @override
  State<NetworkImageMarkerScreen> createState() => _NetworkImageMarkerScreenState();
}

class _NetworkImageMarkerScreenState extends State<NetworkImageMarkerScreen> {
  final Completer<GoogleMapController> _controller = Completer();
  static const CameraPosition _kGooglePlex = CameraPosition(target: LatLng(33.6941, 72.9734),
  zoom: 15);

  final List<Marker> _markers = <Marker> [];
  List<LatLng> _latlng = [
    LatLng(33.6941, 72.9734),
    LatLng(33.7008, 72.9682),
    LatLng(33.6992, 72.9744)
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }
  loadData() async{
    for(int i = 0; i<_latlng.length; i++) {
      Uint8List? image = await loadNetworkImage('https://images.pexels.com/photos/17102047/pexels-photo-17102047/free-photo-of-couple-kissing-son-on-field.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
      );
      final ui.Codec markerImageCodec = await ui.instantiateImageCodec(image!.buffer.asUint8List(),
      targetWidth: 100,
      targetHeight: 100);
      final ui.FrameInfo frameInfo = await markerImageCodec.getNextFrame();
      final ByteData? byteData = await frameInfo.image.toByteData(
        format: ui.ImageByteFormat.png,
      );
      final Uint8List resizeImageMarker = byteData!.buffer.asUint8List();
      _markers.add(Marker(markerId: MarkerId(i.toString()),
      position: _latlng[i],
        icon: BitmapDescriptor.fromBytes(resizeImageMarker),
        infoWindow: InfoWindow(title: 'title of marker' + i.toString(),
        )
      ));
      setState(() {

      });
    }

  }

   Future<Uint8List>loadNetworkImage(String path) async{
    final completed = Completer<ImageInfo>();
    var image = NetworkImage(path);
    image.resolve(ImageConfiguration()).addListener(ImageStreamListener((info, synchronousCall)=> completed.complete(info) )

    );
    final imageInfor = await completed.future;
    final byteData = await imageInfor.image.toByteData(format: ui.ImageByteFormat.png );
    return byteData!.buffer.asUint8List();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: GoogleMap(initialCameraPosition: _kGooglePlex,
      mapType: MapType.normal,
      myLocationEnabled: true,
      myLocationButtonEnabled: true,
      markers: Set<Marker>.of(_markers),
      onMapCreated: (GoogleMapController controller){
        _controller.complete(controller);
      },)),
    );
  }
}
