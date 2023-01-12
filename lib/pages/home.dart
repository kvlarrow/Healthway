import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rppl/components/widgets/card.dart';
import 'package:rppl/components/colors/pallete.dart';
import 'package:rppl/model/hospital.dart';
import 'package:rppl/pages/maps.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  final searchController = TextEditingController();
  List<Hospital> hospitals = [];
  String status = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (hospitals.isEmpty) {
      fetchData();
      fetchData();      
      fetchData();      
    }
  }

  void fetchData() async {
    print('Fetch hospitals');
    const url =
        'https://rs-bed-covid-api.vercel.app/api/get-hospitals?provinceid=35prop&cityid=3578&type=2';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = await jsonDecode(body);
    final results = json['hospitals'] as List<dynamic>;
    final transformed = results.map((e) {
      final beds = Availabel_beds(
        availabel: e['available_beds'][0]['available'],
        bed_class: e['available_beds'][0]['bed_class'],
        room_name: e['available_beds'][0]['room_name'],
        info: e['available_beds'][0]['info'],
      );
      return Hospital(
        id: e['id'],
        name: e['name'],
        address: e['address'],
        phone: e['phone'].toString(),
        available_beds: beds,
      );
    }).toList();
    setState(() {
      hospitals = transformed;
    });
    print('fetch_complete');
  }

  late List<Hospital> filter_display = List.from(hospitals);

  void updateList(String value) {
    setState(() {
      filter_display = hospitals
          .where((element) =>
              element.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
      if (filter_display.isEmpty) {
        status = "data kosong";
      } else {
        status = "";
      }
    });
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
                      child: Text('Info bed RS',
                          style: GoogleFonts.meeraInimai(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: MyColor.white,
                          )),
                    ),
                    Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: MyColor.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(37),
                          topRight: Radius.circular(37),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.only(bottom: 100),
                            height: 800,
                            width: 500,
                            // padding: EdgeInsets.all(23),
                            child: Stack(
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
                                      onChanged: ((value) => updateList(value)),
                                      controller: searchController,
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
                                  height: 10,
                                ),
                                (hospitals.isEmpty)
                                    ? Container(
                                        height: 600,
                                        child: Center(
                                          child: SizedBox(
                                            height: 19,
                                            width: 19,
                                            child: CircularProgressIndicator(
                                              color: MyColor.mainColor,
                                              strokeWidth: 3,
                                            ),
                                          ),
                                        ),
                                      )
                                    : Text(''),
                                
                                Container(
                                  height: 400,
                                  child: Center(child: Text(status, style: TextStyle(color: MyColor.black),)),
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 55),
                                  child: Expanded(
                                    child: (searchController.text == '')
                                        ? ListView.builder(
                                            itemCount: hospitals.length,
                                            itemBuilder: (context, index) {
                                              return MyCard(
                                                namaRumahSakit:
                                                    hospitals[index].name,
                                                alamatRumahSakit:
                                                    hospitals[index].address,
                                                id: hospitals[index].id,
                                                telp: hospitals[index].phone,
                                                kelas: hospitals[index]
                                                    .available_beds
                                                    .bed_class,
                                                info: hospitals[index]
                                                    .available_beds
                                                    .info,
                                                room_name: hospitals[index]
                                                    .available_beds
                                                    .room_name,
                                                tersedia: hospitals[index]
                                                    .available_beds
                                                    .availabel,
                                              );
                                            },
                                          )
                                        : ListView.builder(
                                            itemCount: filter_display.length,
                                            itemBuilder: (context, index) {
                                              return MyCard(
                                                namaRumahSakit:
                                                    filter_display[index].name,
                                                alamatRumahSakit:
                                                    filter_display[index]
                                                        .address,
                                                id: filter_display[index].id,
                                                telp:
                                                    filter_display[index].phone,
                                                kelas: filter_display[index]
                                                    .available_beds
                                                    .bed_class,
                                                info: filter_display[index]
                                                    .available_beds
                                                    .info,
                                                room_name: filter_display[index]
                                                    .available_beds
                                                    .room_name,
                                                tersedia: filter_display[index]
                                                    .available_beds
                                                    .availabel,
                                              );
                                            },
                                          ),
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
                              onTap: (() {}),
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
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        MyMaps(hospitalMap: hospitals),
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
