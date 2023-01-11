import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rppl/components/colors/pallete.dart';
import 'package:rppl/components/widgets/locationPreview.dart';
import 'package:http/http.dart' as http;
import 'package:rppl/model/location.dart';

class MyRoute extends StatefulWidget {
  String nama;
  String id;
  MyRoute({required this.nama, required this.id});

  @override
  State<MyRoute> createState() => _MyRouteState();
}

class _MyRouteState extends State<MyRoute> {
  Map<String, dynamic> lokasiRs = {};

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  late CameraPosition _kGooglePlex = CameraPosition(
    target:
        LatLng(double.parse(lokasiRs['lat']), double.parse(lokasiRs['long'])),
    zoom: 14.4746,
  );

  late CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target:
          LatLng(double.parse(lokasiRs['lat']), double.parse(lokasiRs['long'])),
      tilt: 50.440717697143555,
      zoom: 17.151926040649414);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchLocation();
    fetchLocation();
    fetchLocation();
    fetchLocation();
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }

  void fetchLocation() async {
    print('fetch users called');
    var url =
        'https://rs-bed-covid-indo-api-six.vercel.app/api/get-hospital-map?hospitalid=${widget.id}';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    setState(() {
      lokasiRs = json['data'];
    });
    print('fetch completeted');

    setState(() {
      final Completer<GoogleMapController> _controller =
          Completer<GoogleMapController>();

      CameraPosition _kGooglePlex = CameraPosition(
        target: LatLng(
            double.parse(lokasiRs['lat']), double.parse(lokasiRs['long'])),
        zoom: 14.4746,
      );

      CameraPosition _kLake = CameraPosition(
          bearing: 192.8334901395799,
          target: LatLng(
              double.parse(lokasiRs['lat']), double.parse(lokasiRs['long'])),
          tilt: 50.440717697143555,
          zoom: 17.151926040649414);
    });
  }

  // final Completer<GoogleMapController> _controller =
  //     Completer<GoogleMapController>();

  // CameraPosition _kGooglePlex = CameraPosition(
  //   target:
  //       LatLng(double.parse(lokasiRs['lat']), double.parse(lokasiRs['long'])),
  //   zoom: 14.4746,
  // );

  // CameraPosition _kLake = CameraPosition(
  //     bearing: 192.8334901395799,
  //     target:
  //         LatLng(double.parse(lokasiRs['lat']), double.parse(lokasiRs['long'])),
  //     tilt: 59.440717697143555,
  //     zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion(
        value: SystemUiOverlayStyle.light,
        child: SafeArea(
          child: SizedBox.expand(
            child: Stack(
              children: [
                Center(
                  child: Stack(
                    alignment: Alignment.topLeft,
                    children: [
                      Container(
                        child: Center(
                          child: (lokasiRs['lat'] == null)
                              ? Container(
                                  child: Center(
                                    child: SizedBox(
                                      height: 25,
                                      width: 25,
                                      child: CircularProgressIndicator(
                                        color: MyColor.white,
                                        strokeWidth: 3,
                                      ),
                                    ),
                                  ),
                                )
                              : GoogleMap(
                                  mapType: MapType.normal,
                                  initialCameraPosition: _kGooglePlex,
                                  onMapCreated:
                                      (GoogleMapController controller) {
                                    _controller.complete(controller);
                                  },
                                ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 13, top: 13),
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: MyColor.white,
                            borderRadius: BorderRadius.circular(100),
                            boxShadow: [
                              BoxShadow(
                                  color: MyColor.darkGray,
                                  blurRadius: 3,
                                  spreadRadius: 0,
                                  offset: Offset(0, 1))
                            ]),
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            size: 20,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox.expand(
                  child: DraggableScrollableSheet(
                    initialChildSize: 0.09,
                    minChildSize: 0.09,
                    maxChildSize: 0.4,
                    builder: ((context, scrollController) {
                      return Container(
                        decoration: BoxDecoration(
                            color: MyColor.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(13),
                              topRight: Radius.circular(13),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: MyColor.darkGray,
                                blurRadius: 10.0,
                                spreadRadius: 0,
                                offset: Offset(0, -1),
                              ),
                            ]),
                        child: SingleChildScrollView(
                          controller: scrollController,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 15,
                              ),
                              Center(
                                child: Container(
                                  height: 3,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    color: MyColor.darkGray,
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 13,
                              ),
                              Center(
                                child: Text(
                                  widget.nama,
                                  style: GoogleFonts.meeraInimai(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: MyColor.black),
                                ),
                              ),
                              SizedBox(height: 5,),
                              Center(
                                child: Text(
                                  lokasiRs['address'],
                                  style: GoogleFonts.meeraInimai(
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.grey.shade600),
                                ),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      child: ElevatedButton.icon(
                                        onPressed: () {
                                          _goToTheLake();
                                        },
                                        icon: Icon(
                                          Icons.directions,
                                          size: 20,
                                        ),
                                        label: Text(
                                          'Rute',
                                          style: GoogleFonts.meeraInimai(
                                              fontSize: 12),
                                        ),
                                        style: ButtonStyle(
                                          foregroundColor:
                                              MaterialStatePropertyAll(
                                                  MyColor.white),
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                                  MyColor.secondColor),
                                          shape: MaterialStatePropertyAll(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    SizedBox(
                                      child: ElevatedButton.icon(
                                        onPressed: () {
                                          print(lokasiRs);
                                        },
                                        icon: Icon(
                                          Icons.arrow_upward_sharp,
                                          size: 20,
                                        ),
                                        label: Text(
                                          'Mulai',
                                          style: GoogleFonts.meeraInimai(
                                              fontSize: 12),
                                        ),
                                        style: ButtonStyle(
                                          foregroundColor:
                                              MaterialStatePropertyAll(
                                                  MyColor.white),
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                                  MyColor.secondColor),
                                          shape: MaterialStatePropertyAll(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                child: Container(
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: [
                                        MyPreview(image: 'assets/pict1.jpeg'),
                                        MyPreview(image: 'assets/pict2.jpeg'),
                                        MyPreview(image: 'assets/pict3.jpeg'),
                                        MyPreview(image: 'assets/pict1.jpeg'),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
