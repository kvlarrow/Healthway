import 'package:flutter/material.dart';
import 'package:rppl/components/colors/pallete.dart';
import 'package:rppl/pages/home.dart';
import 'package:rppl/pages/maps2.dart';

class MySplash extends StatefulWidget {
  const MySplash({super.key});

  @override
  State<MySplash> createState() => _MySplashState();
}

class _MySplashState extends State<MySplash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const MyHome()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.mainColor,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/hero.png'),
            SizedBox(
              height: 6,
            ),
            SizedBox(
              height: 19,
              width: 19,
              child: CircularProgressIndicator(
                color: MyColor.white,
                strokeWidth: 3,
              ),
            )
          ],
        ),
      ),
    );
  }
}
