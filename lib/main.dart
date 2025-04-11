// ignore_for_file: prefer_const_constructors, unused_import

import 'package:covid19tracker/screens/home_screen.dart';
import 'package:covid19tracker/screens/top2_cases.dart';
import 'package:covid19tracker/screens/splash_screen.dart';
import 'package:covid19tracker/screens/world_states_screen.dart';
import 'package:flutter/material.dart';

import 'screens/countries_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        // primarySwatch: Colors.,
      ),
      home: SplashScreen(),
    );
  }
}
