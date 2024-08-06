
part of 'alert.dart';


showSnackBar(BuildContext context,
    message, {
      gravity = ToastGravity.BOTTOM,
      duration = const Duration(milliseconds: 5000),
      length = Toast.LENGTH_LONG,
      backgroundColor,
      textColor = Colors.white,
      textSize,
    })  {
  var snackBar = SnackBar(
      duration: duration,
      elevation: 0,
      backgroundColor: Colors.transparent,
      behavior: SnackBarBehavior.floating,
      content: Container(
        decoration: BoxDecoration(color:backgroundColor??MyColors.appColor.withOpacity(0.60), borderRadius: BorderRadius.circular(size_20)),
        margin: EdgeInsets.fromLTRB(0, 0, 0, size_32),
        padding: EdgeInsets.all(size_12),
        child: Text(
          message,
          textAlign: TextAlign.center,
          style: TextStyle(color: textColor,fontSize: textSize??size_14,fontWeight: FontWeight.w600),
        ),
      ));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

showToast(
    message, {
      gravity = ToastGravity.BOTTOM,
      length = Toast.LENGTH_LONG,
      backgroundColor = Colors.black,
      textColor = Colors.white,
      double? textSize ,
    }) {
  return Fluttertoast.showToast(
      msg: "$message",
      toastLength: length,
      gravity: gravity,
      timeInSecForIosWeb: 1,
      backgroundColor: backgroundColor,
      textColor: textColor,
      fontSize: textSize??size_12);
}

void logError(String code, String? message) {
  if (message != null) {
    log('Error: $code\nError Message: $message');
  } else {
    if (kDebugMode) {
      print('Error: $code');
    }
  }
}

void logMessage(message) {
  log('Log Message: $message');
}

void removeFocus({context}) {
  FocusScope.of(context??MyApp.navigatorKey.currentContext).requestFocus(FocusNode());
}