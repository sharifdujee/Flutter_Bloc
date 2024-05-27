import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class CustomMapTheme extends StatefulWidget {
  const CustomMapTheme({super.key});

  @override
  State<CustomMapTheme> createState() => _CustomMapThemeState();
}

class _CustomMapThemeState extends State<CustomMapTheme> {
  String mapTheme = '';
  final Completer<GoogleMapController> _controller = Completer();
  static const CameraPosition _kGooglePlex = CameraPosition(target: LatLng(33.6941  , 72.9734),
  zoom: 15);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DefaultAssetBundle.of(context).loadString('assets/map_them/silver_theme.json').then((value){
      mapTheme = value;

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map Theme'),
        actions: [
          PopupMenuButton(
              itemBuilder: (context)=> [
                PopupMenuItem(
                  onTap: (){
                    _controller.future.then((value){
                      DefaultAssetBundle.of(context).loadString('assets/map_them/silver_theme.json').then((string) {
                        value.setMapStyle(string);

                      });


                    });

                  },
                    child: const Text('Silver')),
                PopupMenuItem(
                    onTap: (){

                    },
                    child: const Text('Retro')),
                PopupMenuItem(
                    onTap: (){

                    },
                    child: const Text('Dark')),
                PopupMenuItem(
                    onTap: (){

                    },
                    child: const Text('Night')),

              ])
        ],
      ),
      body: SafeArea(child: GoogleMap(initialCameraPosition: _kGooglePlex,
      mapType: MapType.normal,
      myLocationButtonEnabled: true,
      myLocationEnabled: true,
      onMapCreated: (GoogleMapController controller){
        controller.setMapStyle(mapTheme);
        _controller.complete(controller);
      },)),
    );
  }
}
