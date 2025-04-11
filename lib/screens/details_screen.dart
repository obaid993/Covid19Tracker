// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'dart:core';

import 'package:covid19tracker/Constants/color.dart';
import 'package:covid19tracker/Widgets/resuable_row.dart';
import 'package:covid19tracker/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class DetailScreen extends StatefulWidget {
  String image;
  String name;
  int? totalCases,
      totalDeaths,
      totalRecovered,
      active,
      critical,
      todayRecovered,
      test;

  DetailScreen({
    required this.image,
    required this.name,
    required this.totalCases,
    required this.totalDeaths,
    required this.totalRecovered,
    required this.active,
    required this.critical,
    required this.todayRecovered,
    required this.test,
  });

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        centerTitle: true,
        backgroundColor: appBarColor,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
              icon: Icon(
                Icons.home_outlined,
                color: Colors.white,
              )),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: PieChart(
                  dataMap: {
                    "Total": widget.totalCases!.toDouble(),
                    "Recovered": widget.totalRecovered!.toDouble(),
                    "Deaths": widget.totalDeaths!.toDouble(),
                  },
                  animationDuration: Duration(milliseconds: 1200),
                  chartLegendSpacing: 32,
                  chartRadius: MediaQuery.of(context).size.width / 4.2,
                  colorList: colorList,
                  initialAngleInDegree: 0,
                  chartType: ChartType.ring,
                  ringStrokeWidth: 25,
                  legendOptions: const LegendOptions(
                    showLegendsInRow: false,
                    legendPosition: LegendPosition.left,
                    showLegends: true,
                    legendTextStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  chartValuesOptions: const ChartValuesOptions(
                    showChartValueBackground: true,
                    showChartValues: true,
                    showChartValuesInPercentage: true,
                    showChartValuesOutside: true,
                    decimalPlaces: 1,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * .067),
                  child: Card(
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .06,
                        ),
                        ReusableRow(
                          title: 'Cases',
                          value: widget.totalCases!.toDouble(),
                        ),
                        ReusableRow(
                          title: 'Recovered',
                          value: widget.totalRecovered!.toDouble(),
                          color: rColor,
                        ),
                        ReusableRow(
                          title: 'Death',
                          value: widget.totalDeaths!.toDouble(),
                          color: dColor,
                        ),
                        ReusableRow(
                          title: 'Critical',
                          value: widget.critical!.toDouble(),
                          color: cColor,
                        ),
                        ReusableRow(
                          title: 'Today Recovered',
                          value: widget.totalRecovered!.toDouble(),
                          color: rColor,
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(widget.image),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
