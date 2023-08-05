import 'package:bazar/app/service/start/splash.dart';
import 'package:flutter/material.dart';

class SplashSCreen extends StatefulWidget {
  const SplashSCreen({super.key});

  @override
  State<SplashSCreen> createState() => _SplashSCreenState();
}

class _SplashSCreenState extends State<SplashSCreen> {
  final SplashService splashService = SplashService();

  @override
  void initState() {
    super.initState();
    splashService.delayeService(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: sized_box_for_whitespace
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Image.asset(
          "assets/images/splash.jpg",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
