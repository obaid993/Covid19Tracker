// ignore_for_file: unused_import, body_might_complete_normally_nullable, unused_field

import 'package:flutter/material.dart';
import '../Services/states_services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../Widgets/reusable_column.dart';

class MostCasesCountries extends StatefulWidget {
  const MostCasesCountries({super.key});

  @override
  State<MostCasesCountries> createState() => _MostCasesCountriesState();
}

class _MostCasesCountriesState extends State<MostCasesCountries>
    with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(duration: const Duration(seconds: 3), vsync: this)
        ..repeat();

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    StatesServices statesServices = StatesServices();
    return Scaffold(
      body: Column(
        children: [
      Expanded(
        child: FutureBuilder(
            future: statesServices.getCountriesStateApi(),
            builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
              if (!snapshot.hasData) {
                return Flexible(
                  
                  child : SpinKitFadingCircle(
                    color : Colors.white,
                    size: 50,
                    controller: _controller,
                  ),
                );
              } else {
                return ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    snapshot.data!
                        .sort((a, b) => b['cases'].compareTo(a['cases']));

                    return Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceEvenly, // Adjust as needed
                      children: [
                        Expanded(
                            child: ReusableColumn(
                                title: snapshot.data![0]['country'],
                             value :   snapshot.data![0]['cases'].toDouble(),)),
                        Expanded(
                            child: ReusableColumn(
                                title: snapshot.data![1]['country'],
                                value: snapshot.data![1]['cases'].toDouble())),
                      ],
                    );
                  },
                );
              }
            }),
      )
        ],
      ),
    );
  }
}
