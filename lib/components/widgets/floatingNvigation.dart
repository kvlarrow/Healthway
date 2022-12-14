import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rppl/components/colors/pallete.dart';
import 'package:rppl/pages/home.dart';
import '../../pages/maps.dart';

class MyFloatingNavigation extends StatelessWidget {
  final String namePage1;
  final String namePage2;
  final Color page1Color;
  final Color page2Color;

  MyFloatingNavigation({required this.namePage1, required this.namePage2, required this.page1Color, required this.page2Color});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                            color: page1Color,
                            size: 25,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            '$namePage1',
                            style: GoogleFonts.meeraInimai(color: page1Color, fontSize: 12,
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
                            color: page2Color,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            '$namePage2',
                            style: GoogleFonts.meeraInimai(color: page2Color, fontSize: 12, fontWeight: FontWeight.w400),
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
    );
  }
}
