// ignore_for_file: unused_import, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:covid19tracker/Constants/color.dart';
import 'package:covid19tracker/screens/countries_list_screen.dart';
import 'package:covid19tracker/screens/world_states_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int myIndex = 0;

  List<Widget> widgetlist = [
    WorldStatesScreen(),
    CountriesListScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: widgetlist[myIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        
          onTap: (index) {
            setState(() {
              myIndex = index;
            });
          },
          currentIndex: myIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',              
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.list_alt_outlined), label: 'Countries',
                
                ),
          ]),
    );
  }
}
