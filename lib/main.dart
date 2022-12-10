import 'package:flutter/material.dart';
import 'package:rppl/pages/rute.dart';

import 'components/addon/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hospital flick',
      home: MySplash(),
    );
  }
}

