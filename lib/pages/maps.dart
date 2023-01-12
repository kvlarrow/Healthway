import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rppl/components/widgets/card.dart';
import 'package:rppl/components/widgets/distanceList.dart';
import 'package:rppl/components/colors/pallete.dart';
import 'package:rppl/model/hospital.dart';
import 'package:rppl/pages/home.dart';
import 'package:rppl/pages/maps.dart';
import 'package:rppl/pages/rute.dart';

class MyMaps extends StatefulWidget {
  List<Hospital> hospitalMap;

  MyMaps({required this.hospitalMap});

  @override
  State<MyMaps> createState() => _MyMapsState();
}

class _MyMapsState extends State<MyMaps> {
  @override
  void initState() {
    super.initState();
  }

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
                        'Daftar Lokasi RS',
                        style: GoogleFonts.meeraInimai(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: MyColor.white,
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height - 70,
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
                          Container(
                            height: MediaQuery.of(context).size.height - 80,
                            padding: EdgeInsets.all(23),
                            child: Column(
                              children: [
                                Expanded(
                                  child: ListView.builder(
                                    itemCount: widget.hospitalMap.length,
                                    itemBuilder: (context, index) {
                                      return ListTile(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => MyRoute(
                                                nama: widget
                                                    .hospitalMap[index].name,
                                                id: widget
                                                    .hospitalMap[index].id,
                                                address: widget
                                                    .hospitalMap[index].address,
                                              ),
                                            ),
                                          );
                                        },
                                        title: Text(
                                          widget.hospitalMap[index].name,
                                          style: GoogleFonts.meeraInimai(
                                              fontSize: 15,
                                              color: MyColor.black),
                                        ),
                                        subtitle: Text(
                                          widget.hospitalMap[index].address,
                                          style: GoogleFonts.meeraInimai(
                                              fontSize: 12,
                                              color: Colors.grey.shade600),
                                        ),
                                        hoverColor: MyColor.mainColor,
                                      );
                                    },
                                  ),
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
                                // Navigator.pop(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) => MyHome(),
                                //   ),
                                // );
                                Navigator.pop(context);
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
                              onTap: (() {}),
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
