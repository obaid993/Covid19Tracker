// ignore_for_file: prefer_const_constructors, unused_import, unused_local_variable

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../Services/states_services.dart';
import '../screens/details_screen.dart';

class CountriesListScreen extends StatefulWidget {
  const CountriesListScreen({super.key});

  @override
  State<CountriesListScreen> createState() => _CountriesListScreenState();
}

class _CountriesListScreenState extends State<CountriesListScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    StatesServices statesServices = StatesServices();
    return Scaffold(
     
      body: SafeArea(
        child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextFormField(
              controller: searchController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                hintText: 'Search with country name',
                suffixIcon: searchController.text.isEmpty
                    ? const Icon(Icons.search)
                    : GestureDetector(
                        onTap: () {
                          searchController.text = "";
                          setState(() {});
                        },
                        child: Icon(Icons.clear)),
              ),
              onChanged: (value) {
                setState(() {});
              },
            ),
          ),
          Expanded(
              child: FutureBuilder(
                  future: statesServices.getCountriesStateApi(),
                  builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                    if (!snapshot.hasData) {
                      return ListView.builder(
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return Shimmer.fromColors(
                              baseColor: Colors.grey.shade700,
                              highlightColor: Colors.grey.shade100,
                              child: Column(
                                children: [
                                  ListTile(
                                    title: Container(
                                        height: 10,
                                        width: 89,
                                        color: Colors.white),
                                    subtitle: Container(
                                      height: 10,
                                      width: 89,
                                      color: Colors.white,
                                    ),
                                    leading: Container(
                                        height: 50,
                                        width: 50,
                                        color: Colors.white),
                                  )
                                ],
                              ),
                            );
                          });
                    } else {
                      return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            String name = snapshot.data![index]['country'];
                            if (searchController.text.isEmpty) {
                              return Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context)=> DetailScreen(
                                            image: snapshot.data![index]['countryInfo']['flag'], 
                                            name: snapshot.data![index]['country'],
                                             totalCases: snapshot.data![index]['cases'],
                                              totalDeaths: snapshot.data![index]['deaths'],
                                               totalRecovered: snapshot.data![index]['recovered'],
                                                active: snapshot.data![index]['active'], 
                                                critical: snapshot.data![index]['critical'], 
                                                todayRecovered: snapshot.data![index]['todayRecovered'], 
                                                test: snapshot.data![index]['test'])));
                                    },
                                    child: ListTile(
                                      leading: Image(
                                        height: 50,
                                        width: 50,
                                        image: NetworkImage(
                                            snapshot.data![index]['countryInfo']
                                                ['flag']),
                                      ),
                                      title: Text(
                                          snapshot.data![index]['country']),
                                      subtitle: Text("Effected: " +
                                          snapshot.data![index]['cases']
                                              .toString()),
                                    ),
                                  ),
                                  Divider()
                                ],
                              );
                            } else if (name.toLowerCase().contains(
                                searchController.text.toLowerCase())) {
                              return Column(
                                children: [
                                  ListTile(
                                    leading: Image(
                                      height: 50,
                                      width: 50,
                                      image: NetworkImage(snapshot.data![index]
                                          ['countryInfo']['flag']),
                                    ),
                                    title:
                                        Text(snapshot.data![index]['country']),
                                    subtitle: Text("Effected: " +
                                        snapshot.data![index]['cases']
                                            .toString()),
                                  ),
                                  Divider()
                                ],
                              );
                            } else {
                              return Container();
                            }
                          });
                    }
                  })),
        ],
      )),
    );
  }
}
