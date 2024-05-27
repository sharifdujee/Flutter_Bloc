import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
class ConvertLatLangToAddress extends StatefulWidget {
  const ConvertLatLangToAddress({super.key});

  @override
  State<ConvertLatLangToAddress> createState() => _ConvertLatLangToAddressState();
}

class _ConvertLatLangToAddressState extends State<ConvertLatLangToAddress> {
  String stAddress = '';
  String stAdd = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Map'),

      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(stAddress),
          GestureDetector(
            onTap: () async{
              List<Location> locations = await locationFromAddress('Gronausestraat 710, Enschede');
              List<Placemark> placemarks = await placemarkFromCoordinates(52.2165157, 6.9437819);

              // from Query
              //final query = '1600 Amphiteatre Parway, Mountain View';

              //final coordinate = new Coordinates(33.6992, 72.9744);

              setState(() {
                stAddress = locations.last.longitude.toString() + '' + locations.last.longitude.toString();
                stAdd = placemarks.reversed.last.country.toString() + '' + placemarks.reversed.last.locality.toString();

              });

            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.green
                ),
                height: 50,
                child:Center(
                  child: Text('Convert'),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
