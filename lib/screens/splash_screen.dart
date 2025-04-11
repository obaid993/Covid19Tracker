// ignore_for_file: unused_import, prefer_const_constructors, unused_field, sized_box_for_whitespace

import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:covid19tracker/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(duration: Duration(seconds: 3), vsync: this)
        ..repeat();

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 6), () => Navigator.push(context, MaterialPageRoute(builder: (context) =>  HomeScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Expanded(
              child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    '   Covid-19\nTracker App',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Horizon',
                        fontSize: 25,
                        color: Colors.white),
                  ))),
          Expanded(
            child: AnimatedBuilder(
              animation: _controller,
              child: Center(
                child: Container(
                  width: 200.0,
                  height: 200.0,
                  child: const Center(
                    child: Image(
                      fit: BoxFit.cover,
                      image: AssetImage('images/virus.png'),
                    ),
                  ),
                ),
              ),
              builder: (BuildContext context, Widget? child) {
                return Transform.rotate(
                  angle: _controller.value * 2.0 * math.pi,
                  child: child,
                );
              },
            ),
          ),
          Expanded(
              child: Row(
            children: [
              const SizedBox(width: 20.0, height: 100.0),
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Center(
                  child: const Text(
                    'YOU WOULD FIND NUMBER OF ',
                    style: TextStyle(fontSize: 10, fontFamily: 'Horizon'),
                  ),
                ),
              ),
              const SizedBox(width: 20.0, height: 100.0),
              DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 12.0,
                  fontFamily: 'Horizon',
                  color: Colors.red,
                ),
                child: AnimatedTextKit(
                  animatedTexts: [
                    RotateAnimatedText('TOTAL CASES'),
                    RotateAnimatedText('DEATHS'),
                    RotateAnimatedText('CRITICAL CASES'),
                    RotateAnimatedText('RECOVERED CASE'),
                    RotateAnimatedText('ATCTIVE CASES'),
                  ],
                ),
              ),
            ],
          ))
       
       
        ],
      )),
    );
  }
}
