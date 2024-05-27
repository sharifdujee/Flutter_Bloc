
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GetUserCurrentLocation extends StatefulWidget{
  const GetUserCurrentLocation({super.key});

  @override
  State<GetUserCurrentLocation> createState() => _GetUserCurrentLocationState();
}

class _GetUserCurrentLocationState extends State<GetUserCurrentLocation> {
  final Completer<GoogleMapController> _controller = Completer();
  static const CameraPosition _kGooglePlex = CameraPosition(target: LatLng(33.6844, 73.0479),
  zoom: 14);
  final List<Marker> _marker =  <Marker> [
    const Marker(markerId: MarkerId('1'),
      position: LatLng(33.6844, 73.0479),
      infoWindow: InfoWindow(
        title: 'The title of the marker'
      )
    ),



  ];
  loadData (){
    UserCurrentLocation().then((value) async {
      print('user current location');
      print(value.latitude.toString() + '' + value.longitude.toString());

      _marker.add(Marker(markerId: MarkerId('2'),
          position: LatLng(value.latitude, value.longitude),
          infoWindow: InfoWindow(
              title: 'User Current Location'
          )
      ));
      CameraPosition cameraPosition = CameraPosition(target: LatLng(value.latitude, value.longitude),
          zoom: 14);
      final GoogleMapController  controller =  await _controller.future;
      controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
      setState(() {

      });

    });

  }
  Future<Position> UserCurrentLocation () async{
    await Geolocator.requestPermission().then((value){

    }).onError((error, stackTrace){
      print('error + ${error.toString()}');

    });
    return await Geolocator.getCurrentPosition();

  }
  @override
  void initState() {
    // TODO: implement initState
    loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(initialCameraPosition: _kGooglePlex,
        markers: Set<Marker>.of(_marker),
        onMapCreated: (GoogleMapController controller){
        _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: () async{
        UserCurrentLocation().then((value) async {
          print('user current location');
          print(value.latitude.toString() + '' + value.longitude.toString());

          _marker.add(Marker(markerId: MarkerId('2'),
              position: LatLng(value.latitude, value.longitude),
              infoWindow: InfoWindow(
                  title: 'User Current Location'
              )
          ));
          CameraPosition cameraPosition = CameraPosition(target: LatLng(value.latitude, value.longitude),
              zoom: 14);
          final GoogleMapController  controller =  await _controller.future;
          controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
          setState(() {

          });

        });


      },
      child: const Icon(Icons.local_activity),),
    );
  }
}
