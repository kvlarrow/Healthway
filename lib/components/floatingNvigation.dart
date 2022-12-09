import 'package:flutter/material.dart';
import 'package:rppl/components/pallete.dart';
import 'package:rppl/pages/home.dart';
import '../pages/maps.dart';

class MyFloatingNavigation extends StatelessWidget {
  const MyFloatingNavigation({super.key});

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
                  IconButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyHome(),
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.bed_outlined,
                      size: 20,
                      color: MyColor.white,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MyMaps(),
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.map,
                      size: 20,
                      color: MyColor.white,
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
