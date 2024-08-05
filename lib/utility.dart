import 'dart:ui';

import 'package:flutter/cupertino.dart';


  const Color mainThemeColor = Color(0xFFF17800);

  const String logo='assets/icons/Rectangle_4__1_-removebg-preview.png';




Widget dashboardContainer({
  required double width,
  required int colorCode,
  required String image,
  required String name,
}) {
  return Container(
    width: width / 2.4,
    height: 40,
    decoration: BoxDecoration(
      color: Color(colorCode),
      borderRadius: BorderRadius.circular(5),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            name,
            style: TextStyle(fontSize: 14),
          ),
        ),
        SizedBox(),
        Image.asset(image),
      ],
    ),
  );
}
