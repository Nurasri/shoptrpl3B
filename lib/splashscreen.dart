import 'package:flutter/material.dart';
import 'package:shoptrpl3b/homepage.dart';
import 'dart:async';

import 'package:shoptrpl3b/onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const OnBoardingPage(),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Image.asset(
        'lib/images/spCart.png',
        scale: 2.2,
      )),
    );
  }
}
