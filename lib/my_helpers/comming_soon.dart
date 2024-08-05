

import 'package:flutter/material.dart';

import 'MyTheme/my_theme.dart';

class CommingSoon extends StatefulWidget {
  const CommingSoon({super.key});

  @override
  State<CommingSoon> createState() => _CommingSoonState();
}

class _CommingSoonState extends State<CommingSoon> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(backgroundColor: MyColors.kColorWhite,foregroundColor: MyColors.appColorBlue,elevation: 0,),
      body: SafeArea(child: Center(child: Image.asset('assets/images/coming_soon.jpg')))
    );
  }
}
