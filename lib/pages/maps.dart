import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rppl/components/widgets/card.dart';
import 'package:rppl/components/widgets/distanceList.dart';
import 'package:rppl/components/widgets/floatingNvigation.dart';
import 'package:rppl/components/colors/pallete.dart';
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
      body: AnnotatedRegion(
        value: SystemUiOverlayStyle.light,
        child: SafeArea(
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
                        style: GoogleFonts.meeraInimai(
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
              Container(
                width: 182,
                height: 94,
                child: Column(
                  children: [
                    Container(
                      height: 54,
                      width: 150,
                      decoration: BoxDecoration(
                          color: MyColor.mainColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: EdgeInsets.only(left: 15, right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: (() {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MyHome(),
                                  ),
                                );
                              }),
                              child: Container(
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.king_bed,
                                      color: MyColor.white,
                                      size: 25,
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      '',
                                      style: GoogleFonts.meeraInimai(
                                          color: MyColor.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: (() {                                
                              }),
                              child: Container(
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.map_rounded,
                                      color: MyColor.secondColor,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Maps',
                                      style: GoogleFonts.meeraInimai(
                                          color: MyColor.secondColor,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
