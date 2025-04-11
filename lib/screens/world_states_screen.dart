// ignore_for_file: unused_import, prefer_const_constructors, prefer_const_literals_to_create_immutables, duplicate_import, unused_local_variable, unused_field

import 'package:covid19tracker/Constants/constant.dart';
import 'package:covid19tracker/Models/world_states_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../Constants/color.dart';
import '../Constants/constant.dart';
import '../Widgets/resuable_row.dart';
import 'package:intl/intl.dart';
import '../Widgets/reusable_column.dart';
import '../Services/states_services.dart';
import 'top2_cases.dart';

class WorldStatesScreen extends StatefulWidget {
  const WorldStatesScreen({super.key});

  @override
  State<WorldStatesScreen> createState() => _WorldStatesScreenState();
}

class _WorldStatesScreenState extends State<WorldStatesScreen>
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
      appBar: AppBar(
        title: Text('Covid 19 Cases in World'),
        centerTitle: true,
        backgroundColor: appBarColor,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          FutureBuilder(
              future: statesServices.getWorldStatesApi(),
              builder: (context, AsyncSnapshot<WorldStatesModel> snapshot) {
                if (!snapshot.hasData) {
                  return Expanded(
                      flex: 1,
                      child: SpinKitFadingCircle(
                        color: Colors.white,
                        size: 50,
                        controller: _controller,
                      ));
                } else {
                  return Expanded(
                    child: Column(
                      children: [
                        Expanded(
                        child: Card(
                              elevation: 3,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Center(
                                        child: Container(
                                          height: double.infinity,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                width: 8,
                                                color: borderColor,
                                              )),
                                          child: Center(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  NumberFormat.compact()
                                                      .format(snapshot
                                                          .data!.cases!
                                                          .toDouble()),
                                                  style: sNumberTextStyle,
                                                ),
                                               
                                                Text(
                                                  'Confirmed Cases',
                                                  style: normalTextStyle,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                 
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        ReusableRow(
                                          title: 'Recovered',
                                          value: snapshot.data!.recovered!
                                              .toDouble(),
                                          color: rColor,
                                        ),
                                        ReusableRow(
                                          title: 'Critical',
                                          value: snapshot.data!.critical!
                                              .toDouble(),
                                          color: cColor,
                                        ),
                                        ReusableRow(
                                          title: 'Deaths',
                                          value: snapshot.data!.deaths!
                                              .toDouble(),
                                          color: dColor,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        
                        Expanded(
                            child: Column(
                          children: [
                            Container(
                              height: 50,
                              width: double.infinity,
                              color: barColor,
                              child: Center(child: Text('Today Cases')),
                            ),
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    child: ReusableColumn(
                                        title: 'Cases',
                                        value: snapshot.data!.todayCases!.toDouble()
                                            )),
                                Expanded(
                                    child: ReusableColumn(
                                        title: 'Recovered',
                                        value: snapshot.data!.todayRecovered!
                                            .toDouble())),
                              ],
                            ),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    child: ReusableColumn(
                                  title: 'Deaths',
                                  value:
                                      snapshot.data!.todayDeaths!.toDouble(),
                                  color: dColor,
                                )),
                              ],
                            ),
                          ],
                        )),
                        Flexible(
                          child: Column(
                            children: [
                              Container(
                                height: 50,
                                width: double.infinity,
                                color: barColor,
                                child: Center(
                                    child:
                                        Text('Top 2 Most Cases Countries')),
                              ),
                              Expanded(child: MostCasesCountries()),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
               
               
                }
              }),
        ],
      ),
    );
  }
}
