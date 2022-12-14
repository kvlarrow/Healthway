import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rppl/components/widgets/bedClass.dart';
import 'package:rppl/components/colors/pallete.dart';

class MyCard extends StatelessWidget {
  final String namaRumahSakit;
  final String alamatRumahSakit;

  MyCard({required this.namaRumahSakit, required this.alamatRumahSakit});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            '$namaRumahSakit',
            style: GoogleFonts.meeraInimai(
              fontSize: 19,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 19,
          ),
          Container(
            width: 212,
            child: Text(
              '$alamatRumahSakit',
              textAlign: TextAlign.center,
              style: GoogleFonts.meeraInimai(
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          SizedBox(
            height: 19,
          ),
          Container(
            height: 347,
            decoration: BoxDecoration(
              color: MyColor.gray,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: MyColor.mainColor,
                  blurRadius: 7,
                  spreadRadius: 0,
                  offset: Offset(1, 2),
                ),
                BoxShadow(
                  color: MyColor.white,
                  blurRadius: 7,
                  spreadRadius: 0,
                  offset: Offset(-1, -2),
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.all(14),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MyBedClass(                    
                    bedClass: 'I',
                  ),
                  MyBedClass(                    
                    bedClass: 'II',
                  ),
                  MyBedClass(                    
                    bedClass: 'II',
                  ),
                  MyBedClass(                    
                    bedClass: 'III',
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 14,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text('Konfirmasi bed'),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: Row(
                    children: [
                      Icon(
                        Icons.call,
                        size: 15,
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text('0313717141'),
                      SizedBox(
                        width: 3,
                      ),
                      IconButton(
                        icon: Icon(Icons.copy),
                        iconSize: 15,
                        onPressed: () {},
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 14),
          Container(
            height: 1,
            color: Colors.black,
          ),
          SizedBox(
            height: 14,
          ),
        ],
      ),
    );
  }
}
