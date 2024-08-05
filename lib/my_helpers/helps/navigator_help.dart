
import 'package:flutter/material.dart';

import '../../main.dart';




navigatorPush(widgetScreen, {required BuildContext context, bool fullscreenDialog = false}) async {
  return await Navigator.push(
    context,
    PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 900),
      pageBuilder: (context, animation, secondaryAnimation) => widgetScreen,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = const Offset(1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
      fullscreenDialog: fullscreenDialog,
    ),
  );
}

navigatorPushReplace(widgetScreen, {context})async {
  return await Navigator.of(context??MyApp.navigatorKey.currentContext).pushAndRemoveUntil(MaterialPageRoute(
      builder: (_) =>widgetScreen),(Route<dynamic> route) => false);
}

goBack({param,context}) {
  if(Navigator.canPop(context??MyApp.navigatorKey.currentContext!)) {
    Navigator.pop(context??MyApp.navigatorKey.currentContext!,param);
  }
}

navigatorPop({int popCount = 0,context}) {
  Navigator.of(context??MyApp.navigatorKey.currentContext!).popUntil((_) => popCount-- <= 0);
}