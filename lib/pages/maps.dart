import 'package:flutter/material.dart';
import 'package:rppl/components/card.dart';
import 'package:rppl/components/distanceList.dart';
import 'package:rppl/components/floatingNvigation.dart';
import 'package:rppl/components/pallete.dart';
import 'package:rppl/pages/home.dart';
import 'package:rppl/pages/maps.dart';

class MyMaps extends StatefulWidget {
  const MyMaps({super.key});

  @override
  State<MyMaps> createState() => _MyMapsState();
}

class _MyMapsState extends State<MyMaps> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.mainColor,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 24),
                    height: 66,
                    color: MyColor.mainColor,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'RS terdekat',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: MyColor.white,
                      ),
                    ),
                  ),
                  Container(
                    height: 1000,
                    width: 500,
                    decoration: BoxDecoration(
                      color: MyColor.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(37),
                        topRight: Radius.circular(37),
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(23),
                          child: Column(
                            children: [
                              Column(                                
                                children: [
                                  MyDistanceList(
                                      jarak: 10,
                                      namaRS: 'RS Umum Daerah Dr. Soetomo'),
                                  MyDistanceList(
                                      jarak: 16, namaRS: 'RS Umum Siloam'),
                                  MyDistanceList(
                                      jarak: 11,
                                      namaRS:
                                          'RS Primasatya Husada Citra (PHC) Surabaya'),
                                  MyDistanceList(
                                      jarak: 40,
                                      namaRS: 'RS Manyar Medical Center'),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            MyFloatingNavigation()
          ],
        ),
      ),
    );
  }
}
