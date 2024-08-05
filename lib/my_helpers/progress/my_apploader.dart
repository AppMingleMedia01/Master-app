

import 'package:flutter/material.dart';

import '../MyTheme/my_theme.dart';

Widget appLoader({Color color = MyColors.appColor,double? width})
{
  return CircularProgressIndicator(color: color);
}
Widget bookLoader({Color color = MyColors.appColor,double? width})
{
  return  Center(
    child: Stack(
      alignment: Alignment.center,
      children: <Widget>[
        // Background Image
        Container(
          decoration: BoxDecoration(
            color: MyColors.kColorWhite,
            borderRadius: BorderRadius.circular(size_15),
            boxShadow: const [
              BoxShadow(
                offset: Offset(0.1,0.1),
                blurRadius: 2.5,
                spreadRadius: 0.1
              )
            ]
          ),
          child: Padding(
            padding:  const EdgeInsets.all(20.0),
            child: Image.asset(
              'image/book.gif', // Replace with your image asset path
              fit: BoxFit.cover,
              height: size_28,
              width: size_28,

            ),
          ),
        ),
        SizedBox(height:size_44,width: size_44,child: CircularProgressIndicator(
          color: MyColors.appColorBlue, strokeWidth: size_3,)),
      ],
    ),
  );
}
