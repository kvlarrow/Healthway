import 'package:flutter/material.dart';
import 'package:rppl/components/pallete.dart';

class MyRoute extends StatefulWidget {
  const MyRoute({super.key});

  @override
  State<MyRoute> createState() => _MyRouteState();
}

class _MyRouteState extends State<MyRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: MyColor.mainColor,
      ),
    );
  }
}