import 'package:flutter/material.dart';
import 'package:rppl/components/widgets/card.dart';
import 'package:rppl/components/widgets/floatingNvigation.dart';
import 'package:rppl/components/colors/pallete.dart';
import 'package:rppl/pages/maps.dart';


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
                      'Info bed RS',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: MyColor.white,
                      ),
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
                                        hintStyle: TextStyle(
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
            MyFloatingNavigation()
          ],
        ),
      ),
    );
  }
}
