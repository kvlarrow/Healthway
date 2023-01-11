import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rppl/components/widgets/bedClass.dart';
import 'package:rppl/components/colors/pallete.dart';
import 'package:url_launcher/url_launcher.dart';

class MyCard extends StatelessWidget {
  final String namaRumahSakit;
  final String alamatRumahSakit;
  final String id;
  final String telp;
  final String kelas;
  final int tersedia;
  final String info;
  final String room_name;

  MyCard({
    required this.namaRumahSakit,
    required this.alamatRumahSakit,
    required this.id,
    required this.telp,
    required this.kelas,
    required this.tersedia,
    required this.info,
    required this.room_name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      width: 310,
      child: Column(
        children: [
          GestureDetector(
            onTap: (() {
              launch('https://sirs.kemkes.go.id/fo/home/profile_rs/${id}');
            }),
            child: Text(
              '$namaRumahSakit',
              style: GoogleFonts.meeraInimai(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
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
            height: 80,
            width: 350,
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
            child: Container(
              padding: EdgeInsets.all(14),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                color: (tersedia < 5)
                                    ? Colors.yellow
                                    : (tersedia >= 5 && tersedia < 10)
                                        ? Colors.green
                                        : Colors.blue,
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: 28,
                              child: Text(
                                '$kelas',
                                style: GoogleFonts.meeraInimai(fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        child: Container(
                          width: 80,
                          child: Text(
                            '$room_name',
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.meeraInimai(
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 50,
                        child: Text(
                          'Tersedia ${tersedia} bed kosong',
                          style: GoogleFonts.meeraInimai(fontSize: 12),
                        ),
                      ),
                      Container(
                        width: 50,
                        child: Text(
                          '$info',
                          style: GoogleFonts.meeraInimai(fontSize: 12),
                        ),
                      ),
                    ],
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
                  child: Text(
                    'Konfirmasi bed',
                    style: GoogleFonts.meeraInimai(),
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: Row(
                    children: [
                      Container(
                        width: 15,
                        child: IconButton(
                          icon: Icon(Icons.call, size: 15,),
                          onPressed: () {
                            launch('tel:${telp}');
                          },
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '$telp',
                        style: GoogleFonts.meeraInimai(),
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      IconButton(
                        icon: Icon(Icons.copy),
                        iconSize: 15,
                        onPressed: () {
                          Clipboard.setData(ClipboardData(text: telp))
                              .then((value) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                duration: Duration(seconds: 2),
                                elevation: 20,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                behavior: SnackBarBehavior.floating,
                                backgroundColor: MyColor.mainColor,
                                content: Text(
                                  'Nomor disimpan di clipboard!!',
                                  style: GoogleFonts.meeraInimai(
                                      fontSize: 11,
                                      color: MyColor.white,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                            );
                          });
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 14),
          Container(
            width: 350,
            height: 1,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
