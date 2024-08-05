import 'package:flutter/material.dart';

import '../MyTheme/my_theme.dart';


Widget getVerticalLine({Color? color,double? height})
{
  return Container(
    width: 1,
    height: height??size_20,
    color: color??Colors.grey,
  );
}

Widget getHorizontalLine({Color? color,EdgeInsets? margin}) {
  return  Container(
    width: double.infinity,
    height: 1,
    margin: margin??const EdgeInsets.all(0),
    color: color??MyColors.kColorBorderGrey,
  );
}