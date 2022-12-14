import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rppl/components/colors/pallete.dart';

class MyBedClass extends StatelessWidget {  
  final String bedClass;

  MyBedClass({required this.bedClass});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 5,
                    height: 40,
                    decoration: BoxDecoration(
                      color: (bedClass.length == 1)? MyColor.firstClass:(bedClass.length == 2)? MyColor.secondClass: MyColor.thirdClass,                        
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Kelas',
                          style: GoogleFonts.meeraInimai(fontSize: 12),
                        ),
                        Text(
                          '$bedClass',
                          style: GoogleFonts.meeraInimai(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  Text(
                    'Ruang',
                    style: GoogleFonts.meeraInimai(
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    'Bobo I',
                    style: GoogleFonts.meeraInimai(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 50,
              child: Text(
                'Tersedia 6 bed kosong',
                style: GoogleFonts.meeraInimai(fontSize: 12),
              ),
            ),
            Container(
              width: 50,
              child: Text(
                'Diupdate 2 menit yang lalu',
                style: GoogleFonts.meeraInimai(fontSize: 12),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 14,
        ),
        Container(
          width: 241,
          height: 1,
          color: MyColor.darkGray,
        ),
        SizedBox(
          height: 9,
        )
      ],
    );
  }
}
