import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomInfoWindowScreen extends StatefulWidget {
  const CustomInfoWindowScreen({super.key});

  @override
  State<CustomInfoWindowScreen> createState() => _CustomInfoWindowScreenState();
}

class _CustomInfoWindowScreenState extends State<CustomInfoWindowScreen> {
  CustomInfoWindowController _customInfoWindowController =
      CustomInfoWindowController();
  final List<Marker> _marker = <Marker>[
    Marker(markerId: MarkerId('12'), position: LatLng(33.6941, 72.9734))
  ];
  final List<LatLng> _latLang = [
    LatLng(33.6941, 72.9734),
    LatLng(33.7008, 72.9682),
    LatLng(33.6992, 72.9744),
    LatLng(33.6939, 77.9771),
    LatLng(33.6910, 72.9807),
    LatLng(33.7036, 72.9785)
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() {
    for (int i = 0; i < _latLang.length; i++) {
      if(i % 2 == 0){
        _marker.add(
          Marker(
              markerId: MarkerId(i.toString()),
              icon: BitmapDescriptor.defaultMarker,
              position: _latLang[i],
              onTap: (){
                _customInfoWindowController.addInfoWindow!(
                    Container(
                      height: 300,
                      width: 200,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.green,
                        ),
                      ),
                    ),
                    _latLang[i]
                );
              }
          ),
        );

      }
      else{
        _marker.add(
          Marker(
              markerId: MarkerId(i.toString()),
              icon: BitmapDescriptor.defaultMarker,
              position: _latLang[i],
              onTap: (){
                _customInfoWindowController.addInfoWindow!(
                    Container(
                      height: 300,
                      width: 200,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 100,
                            width: 300,
                            decoration: const BoxDecoration(
                                image: DecorationImage(image: NetworkImage('https://images.pexels.com/photos/38271/ipad-map-tablet-internet-38271.jpeg?auto=compress&cs=tinysrgb&w=600'),
                                    fit: BoxFit.fitWidth,
                                    filterQuality: FilterQuality.high),
                                borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                          ),
                          Container(
                            height: 100,
                            width: 300,
                            decoration: const BoxDecoration(
                                image: DecorationImage(image: NetworkImage('https://images.pexels.com/photos/1166120/pexels-photo-1166120.jpeg?auto=compress&cs=tinysrgb&w=600'),
                                    fit: BoxFit.fitWidth,
                                    filterQuality: FilterQuality.high),
                                borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                          ),
                          Container(
                            height: 100,
                            width: 300,
                            decoration: const BoxDecoration(
                                image: DecorationImage(image: NetworkImage('https://images.pexels.com/photos/1166120/pexels-photo-1166120.jpeg?auto=compress&cs=tinysrgb&w=600'),
                                    fit: BoxFit.fitWidth,
                                    filterQuality: FilterQuality.high),
                                borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                          ),



                        ],
                      ),
                    ),
                    _latLang[i]
                );
              }
          ),
        );

      }

      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Info Window'),
      ),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition:
                CameraPosition(target: LatLng(33.6941, 72.9734),
                zoom: 15),
            markers: Set.of(_marker),
            onTap: (position) {
              _customInfoWindowController.hideInfoWindow!();
            },
            onMapCreated: (GoogleMapController controller) {
              _customInfoWindowController.googleMapController = controller;
            },
            onCameraMove: (position){
              _customInfoWindowController.onCameraMove!();
            },
            
          ),
          CustomInfoWindow(controller: _customInfoWindowController,
          height: 200,
          width: 300,
          offset: 35,)
        ],
      ),
    );
  }
}
