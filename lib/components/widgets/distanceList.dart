import 'package:flutter/material.dart';
import 'package:rppl/components/colors/pallete.dart';
import 'package:rppl/pages/rute.dart';

class MyDistanceList extends StatelessWidget {
  final int jarak;
  final String namaRS;

  MyDistanceList({required this.jarak, required this.namaRS});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 13),
      padding: EdgeInsets.only(left: 10, right: 5, top: 3, bottom: 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        color: MyColor.white,
        boxShadow: [
          BoxShadow(
            color: MyColor.darkGray,
            blurRadius: 3,
            spreadRadius: 0,
            offset: Offset(0, 2),
          ),
          BoxShadow(
            color: MyColor.darkGray,
            blurRadius: 5,
            spreadRadius: 0,
            offset: Offset(1, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$namaRS',
                style: TextStyle(fontSize: 12),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 13),
                child: Row(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Text(
                            '${jarak}m',
                            style: TextStyle(fontSize: 12),
                          ),
                          Container(
                            height: 1,
                            width: 15,
                            decoration: BoxDecoration(
                              color:
                                  jarak > 15 ? MyColor.red : MyColor.firstClass,
                            ),
                          )
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MyRoute(),
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.location_pin,
                        color: MyColor.mainColor,
                        size: 15,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
