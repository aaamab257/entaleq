import 'package:entaqel_task/pages/places/screen/places_screen.dart';
import 'package:entaqel_task/helpers/images.dart';
import 'package:flutter/material.dart';
import 'package:timer_count_down/timer_count_down.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Countdown(
        seconds: 3,
        build: (BuildContext context, double time) => Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Image.asset(
              ImagesHelper.logo,
              scale: 2.5,
            ),
          ),
        ),
        onFinished: () {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute<void>(
                  builder: (BuildContext context) => const PlacesScreen()),
              (route) => false);
        },
      );
    });
  }
}
