import 'package:flutter/material.dart';
import 'package:flutter_roadmap/coivd_tracker_apps/components/reusable_row.dart';

class CovidDetailsScreen extends StatefulWidget {
  String image;
  String name;
  int totalCases;
  int totalDeaths;
  int totalRecovered;
  int active;
  int critical;
  int todayRecovered;
  int test;
  CovidDetailsScreen(
      {required this.image,
      required this.name,
      required this.totalCases,
      required this.totalDeaths,
      required this.totalRecovered,
      required this.critical,
      required this.active,
      required this.test,
      required this.todayRecovered});

  @override
  State<CovidDetailsScreen> createState() => _CovidDetailsScreenState();
}

class _CovidDetailsScreenState extends State<CovidDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.name),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*.067),
                child: Card(
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height *.06,
                      ),
                      ReusableProperties(title: 'Cases', value: widget.totalCases.toString()),
                      ReusableProperties(title: 'Recovered', value: widget.totalRecovered.toString()),
                      ReusableProperties(title: 'Active', value: widget.active.toString()),
                      ReusableProperties(title: 'Critical', value: widget.critical.toString()),
                      ReusableProperties(title: 'Test', value: widget.test.toString()),
                      ReusableProperties(title: 'Today Recovered', value: widget.todayRecovered.toString()),
                      ReusableProperties(title: 'Death', value: widget.totalDeaths.toString()),
                    ],
                  ),
                ),
              ),
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(widget.image),
              )
            ],
          )
        ],
      ),
    );
  }
}
