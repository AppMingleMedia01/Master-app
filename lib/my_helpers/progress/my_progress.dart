

import 'package:flutter/material.dart';

import '../../main.dart';
import '../helps/navigator_help.dart';
import '../my_alerts/alert.dart';

class MyProgressDialog
{
  bool loading = false;

  show({BuildContext? context,bool dismissible = true})
  {
    loading=true;
    BottomModalSheet.onLoadingAsync(ctx: context??MyApp.navigatorKey.currentContext!,dismissible: dismissible).then((value) => {
      loading=false
    });
  }

  void hide()
  {
    if(loading) {
      goBack();
      loading = false;
    }
  }

  isShowing()
  {
    return loading;
  }

// static Future<void> onLoadingAsync({BuildContext? ctx,bool dismissible = false}) async {
//   print("onLoading");
//   await showDialog(
//       context: ctx??MyApp.navigatorKey.currentContext!,
//       barrierDismissible: dismissible,
//       builder: (_) => Material(
//           type: MaterialType.transparency,
//           child: WillPopScope(
//             onWillPop: () {
//               return Future.value(dismissible);
//             },
//             child: Center(
//                 child: Container(
//                   padding: EdgeInsets.all(size_18),
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(size_12),
//                       color: MyColors.kColorWhite
//                   ),
//                   child: appLoader(),
//                 )),
//           )));
// }


}