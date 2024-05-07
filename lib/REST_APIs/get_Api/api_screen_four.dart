import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_roadmap/model/products_model.dart';
import 'package:http/http.dart' as http;

class APIScreenFour extends StatefulWidget {
  const APIScreenFour({super.key});

  @override
  State<APIScreenFour> createState() => _APIScreenFourState();
}

class _APIScreenFourState extends State<APIScreenFour> {
  Future<ProductsModel> getProducts() async {
    final response = await http.get(
      Uri.parse('https://webhook.site/219a4c9c-63fd-4189-bc50-9c9ccf00ac12'),
    );
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return ProductsModel.fromJson(data);
    } else {
      return ProductsModel.fromJson(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('API Screen Four'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
                child: FutureBuilder<ProductsModel>(
                    future: getProducts(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          scrollDirection: Axis.vertical,
                            itemCount: snapshot.data!.data!.length,
                            itemBuilder: (context, index) {
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ListTile(
                                    title: Text(snapshot.data!.data![index].shop!.name.toString()),
                                    subtitle: Text(snapshot.data!.data![index].shop!.shopemail.toString()),
                                    leading: CircleAvatar(
                                      backgroundImage: NetworkImage(snapshot.data!.data![index].shop!.image.toString()),
                                    ),

                                  ),
                                  SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height * 3,
                                    width: MediaQuery.of(context).size.width * 1,
                                    child: ListView.builder(
                                      itemCount: snapshot.data!.data![index].images!.length,
                                        itemBuilder: (context, position) {
                                      return Padding(
                                        padding: const EdgeInsets.only(right: 10),
                                        child: Container(

                                          height:
                                          MediaQuery.of(context).size.height * .25,
                                          width: MediaQuery.of(context).size.width * .5,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                                image: NetworkImage(snapshot.data!.data![index].images![position].url.toString()
                                            ))
                                          ),
                                        ),
                                      );
                                    }),
                                  ),
                                  Icon(snapshot.data!.data![index].inWishlist! == true? Icons.favorite: (Icons.favorite_outline))
                                ],
                              );
                            });
                      } else {
                        return const Text('Loading');
                      }
                    }))
          ],
        ),
      ),
    );
  }
}
