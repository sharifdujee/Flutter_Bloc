import 'package:flutter/material.dart';
import 'package:flutter_roadmap/coivd_tracker_apps/details_screen.dart';
import 'package:flutter_roadmap/coivd_tracker_apps/services/states_services.dart';
import 'package:shimmer/shimmer.dart';

class CountryWiseList extends StatefulWidget {
  const CountryWiseList({super.key});

  @override
  State<CountryWiseList> createState() => _CountryWiseListState();
}

class _CountryWiseListState extends State<CountryWiseList> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    StateServices stateServices = StateServices();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              onChanged: (value) {
                setState(() {});
              },
              controller: searchController,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  hintText: 'Search with country name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50))),
            ),
          ),
          Expanded(
              child: FutureBuilder(
                  future: stateServices.countriesWiseList(),
                  builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                    if (!snapshot.hasData) {
                      return ListView.builder(
                          itemCount: 25,
                          itemBuilder: (context, index) {
                            return Shimmer.fromColors(
                                baseColor: Colors.grey.shade700,
                                highlightColor: Colors.grey.shade100,
                                child: Column(
                                  children: [
                                    ListTile(
                                      title: Container(
                                        height: 10,
                                        width: 80,
                                        color: Colors.teal,
                                      ),
                                      subtitle: Container(
                                        height: 10,
                                        width: 80,
                                        color: Colors.teal,
                                      ),
                                      leading: Container(
                                        height: 10,
                                        width: 80,
                                        color: Colors.teal,
                                      ),
                                    )
                                  ],
                                ));
                          });
                    } else {
                      return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            String name = snapshot.data![index]['country'];
                            if (searchController.text.isEmpty) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => CovidDetailsScreen(
                                              image: snapshot.data![index]
                                                  ['countryInfo']['flag'],
                                              name: snapshot.data![index]
                                                  ['country'],
                                              totalCases: snapshot.data![index]
                                                  ['cases'],
                                              totalDeaths: snapshot.data![index]
                                                  ['deaths'],
                                              totalRecovered: snapshot.data![index]
                                                  ['recovered'],
                                              critical: snapshot.data![index]
                                                  ['critical'],
                                              active: snapshot.data![index]
                                                  ['active'],
                                              test: snapshot.data![index]
                                                  ['tests'],
                                              todayRecovered: snapshot.data![index]
                                                  ['todayRecovered'])));
                                },
                                child: Column(
                                  children: [
                                    ListTile(
                                      title: Text(
                                          snapshot.data![index]['country']),
                                      subtitle: Text(snapshot.data![index]
                                              ['cases']
                                          .toString()),
                                      leading: Image(
                                          height: 50,
                                          width: 50,
                                          image: NetworkImage(
                                              snapshot.data![index]
                                                  ['countryInfo']['flag'])),
                                    )
                                  ],
                                ),
                              );
                            } else if (name.toLowerCase().contains(
                                searchController.text.toLowerCase())) {
                              return Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => CovidDetailsScreen(
                                                  image: snapshot.data![index]
                                                  ['countryInfo']['flag'],
                                                  name: snapshot.data![index]
                                                  ['country'],
                                                  totalCases: snapshot.data![index]
                                                  ['cases'],
                                                  totalDeaths: snapshot.data![index]
                                                  ['deaths'],
                                                  totalRecovered: snapshot.data![index]
                                                  ['recovered'],
                                                  critical: snapshot.data![index]
                                                  ['critical'],
                                                  active: snapshot.data![index]
                                                  ['active'],
                                                  test: snapshot.data![index]
                                                  ['tests'],
                                                  todayRecovered: snapshot.data![index]
                                                  ['todayRecovered'])));
                                    },
                                    child: Column(
                                      children: [
                                        ListTile(
                                          title: Text(
                                              snapshot.data![index]['country']),
                                          subtitle: Text(snapshot.data![index]
                                          ['cases']
                                              .toString()),
                                          leading: Image(
                                              height: 50,
                                              width: 50,
                                              image: NetworkImage(
                                                  snapshot.data![index]
                                                  ['countryInfo']['flag'])),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            } else {
                              return Container();
                            }
                          });
                    }
                  }))
        ],
      )),
    );
  }
}
