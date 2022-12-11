import 'package:flutter/material.dart';
import 'package:rppl/components/colors/pallete.dart';
import 'package:rppl/pages/rute.dart';

class MyDistanceList extends StatelessWidget {
  final int jarak;
  final String namaRS;

  MyDistanceList({required this.jarak, required this.namaRS});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MyRoute(nama: namaRS),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 13),
        padding: EdgeInsets.only(left: 10, right: 5, top: 10, bottom: 10),
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '$namaRS',
                  style: TextStyle(fontSize: 12),
                ),
                Container(      
                  height: 33,            
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${jarak}m',
                              style: TextStyle(fontSize: 12),
                            ),                            
                            Container(
                              height: 1,
                              width: 15,
                              decoration: BoxDecoration(
                                color: jarak > 15
                                    ? MyColor.red
                                    : MyColor.firstClass,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: 10,),
                      Icon(Icons.location_pin, size: 20, color: MyColor.mainColor,),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
