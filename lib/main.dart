import 'package:bazar/app/frontend/start/splashscreen.dart';
import 'package:bazar/app/providers/userprovider.dart';
import 'package:bazar/app/routes/routing.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => userProvider(),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bazaar',
      home: const SplashSCreen(),
      onGenerateRoute: (settings) => onGenreateSetting(settings),
    );
  }
}
