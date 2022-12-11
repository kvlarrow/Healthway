import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:rppl/components/colors/pallete.dart';
import 'package:rppl/components/widgets/locationPreview.dart';

class MyRoute extends StatelessWidget {
  final String nama;

  MyRoute({required this.nama});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.gray,
      body: SafeArea(
        child: SizedBox.expand(
          child: Stack(
            children: [
              Center(
                child: Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    Container(
                      child: Center(
                        child: Text(
                          'ini map',
                          style: TextStyle(color: MyColor.darkGray, fontSize: 10),
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
                            SizedBox(height: 15,),
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
                                '$nama',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: MyColor.black),
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
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.directions,
                                        size: 20,
                                      ),
                                      label: Text(
                                        'Rute',
                                        style: TextStyle(fontSize: 12),
                                      ),
                                      style: ButtonStyle(
                                        foregroundColor:
                                            MaterialStatePropertyAll(MyColor.white),
                                        backgroundColor: MaterialStatePropertyAll(
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
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.arrow_upward_sharp,
                                        size: 20,
                                      ),
                                      label: Text(
                                        'Mulai',
                                        style: TextStyle(fontSize: 12),
                                      ),
                                      style: ButtonStyle(
                                        foregroundColor:
                                            MaterialStatePropertyAll(MyColor.white),
                                        backgroundColor: MaterialStatePropertyAll(
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
    );
  }
}
