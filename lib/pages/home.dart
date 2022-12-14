import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rppl/components/widgets/card.dart';
import 'package:rppl/components/widgets/floatingNvigation.dart';
import 'package:rppl/components/colors/pallete.dart';
import 'package:rppl/pages/maps.dart';
import 'package:google_fonts/google_fonts.dart';


class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
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
                        'Info bed RS',
                        style: GoogleFonts.meeraInimai(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: MyColor.white,                          
                        )
                      ),
                    ),
                    Container(
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
                                Container(
                                  padding: EdgeInsets.only(
                                    left: 15,
                                  ),
                                  height: 45,
                                  decoration: BoxDecoration(
                                    color: MyColor.gray,
                                    borderRadius: BorderRadius.circular(100.0),
                                  ),
                                  child: Theme(
                                    data: Theme.of(context)
                                        .copyWith(primaryColor: Colors.amber),
                                    child: TextField(
                                      cursorColor: MyColor.mainColor,
                                      decoration: InputDecoration(
                                          iconColor: MyColor.mainColor,
                                          focusColor: MyColor.mainColor,
                                          border: InputBorder.none,
                                          suffixIcon: Icon(
                                            Icons.search_sharp,
                                            size: 18,
                                            color: MyColor.mainColor,
                                          ),
                                          hintText: 'Cari rumah sakit',
                                          hintStyle: GoogleFonts.meeraInimai(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400)),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                MyCard(
                                  namaRumahSakit: 'RS Umum Daerah Dr. Soetomo',
                                  alamatRumahSakit:
                                      'Jl. Mayjend. Prof. Dr. Moestopo No. 6 - 8 Surabaya, Jawa Timur',
                                ),
                                MyCard(
                                  namaRumahSakit:
                                      'RS Primasatya Husada Citra (PHC) Surabaya',
                                  alamatRumahSakit:
                                      'Jl. Prapat Kurung Selatan no 1 Tanjung Perak Surabaya',
                                ),
                                MyCard(
                                  namaRumahSakit: 'RS Umum Daerah Dr. Soetomo',
                                  alamatRumahSakit:
                                      'Jl. Mayjend. Prof. Dr. Moestopo No. 6 - 8 Surabaya, Jawa Timur',
                                ),
                                MyCard(
                                  namaRumahSakit:
                                      'RS Primasatya Husada Citra (PHC) Surabaya',
                                  alamatRumahSakit:
                                      'Jl. Prapat Kurung Selatan no 1 Tanjung Perak Surabaya',
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
                              }),
                              child: Container(
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.king_bed,
                                      color: MyColor.secondColor,
                                      size: 25,
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      'Bed',
                                      style: GoogleFonts.meeraInimai(
                                          color: MyColor.secondColor,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: (() {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MyMaps(),
                                  ),
                                );
                              }),
                              child: Container(
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.map_rounded,
                                      color: MyColor.white,
                                    ),
                                    SizedBox(
                                      width: 5,
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
