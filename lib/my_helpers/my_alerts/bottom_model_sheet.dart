
part of 'alert.dart';





class BottomModalSheet {

  static void yesNoBottomSheet(context, message, successMethod) {
    showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.white,
        shape:  RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(size_24), topRight: Radius.circular(size_24)),
        ),
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.all(24.0),
            child:  Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 32.0),
                  child:  Text(
                    message,
                    textAlign: TextAlign.center,
                    style: MyTextStyle.kTextRegular,
                  ),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                        child: MaterialButton(
                          padding: EdgeInsets.symmetric(
                            vertical: size_16,
                          ),
                          color: Colors.grey[100],
                          colorBrightness: Brightness.light,
                          elevation: 2,
                          highlightElevation: 12,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6)),
                          onPressed: () {
                            //Do something
                            Navigator.pop(context);
                          },
                          child: const Text('No'),
                        )),
                    SizedBox(
                      width: size_16,
                    ),
                    Expanded(
                      child: MaterialButton(
                        padding: EdgeInsets.symmetric(
                          vertical: size_16,
                        ),
                        color: MyColors.appColor,
                        colorBrightness: Brightness.dark,
                        highlightElevation: 12,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6)),
                        onPressed: () {
                          Navigator.pop(context);
                          successMethod();
                          //Do something
                        },
                        child: const Text('Yes'),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size_24,
                )
              ],
            ),
          );
        });
  }


  static void twoActionBottomSheet({BuildContext? context, required message,String title="", confirmText="Confirm",onConfirm,cancelText="Cancel",onCancel})
  {
    showModalBottomSheet<void>(
        context: context??MyApp.navigatorKey.currentContext!,
        isScrollControlled: true,
        backgroundColor: MyColors.fillLightColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(size_30), topRight: Radius.circular(size_30)),
        ),
        builder: (BuildContext context) {
          return Container(
            padding: EdgeInsets.all(size_24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                if(title.isNotEmpty)
                  Container(
                    margin: EdgeInsets.only(bottom: size_12),
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: MyTextStyle.kTextBold.copyWith(fontSize: size_18),
                    ),
                  ),
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: MyTextStyle.kTextSemiBold,
                ),
                SizedBox(height: size_24,),
                Row(
                  children: <Widget>[

                    Expanded(
                        child: OutlineButton(onPressed: (){
                          Navigator.pop(context);
                          if(onCancel!=null) {
                            onCancel();
                          }
                        },
                          title: cancelText,margin: EdgeInsets.zero,)),

                    SizedBox(
                      width: size_16,
                    ),
                    Expanded(
                      child: ElevatedCommonButton(onPressed: (){
                        Navigator.pop(context);
                        if(onConfirm!=null) {
                          onConfirm();
                        }
                      },color: MyColors.appColor,
                        title: confirmText,margin: EdgeInsets.zero,),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }

  static Future customChildSheet({required Widget child,BuildContext? context, isCancelable = true}) {
    return showModalBottomSheet(
        context: context??MyApp.navigatorKey.currentContext!,
        isScrollControlled: true,
        backgroundColor: MyColors.fillLightColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(size_30), topRight: Radius.circular(size_30)),
        ),
        builder: (BuildContext context) {
          return BackdropFilter(
            // blendMode: BlendMode.darken,
            filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
            child: ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(size_30), topRight: Radius.circular(size_30)),
              child: WillPopScope(
                  onWillPop: () async {
                    return isCancelable;
                  },
                  child: Padding(
                      padding: MediaQuery.of(context).viewInsets,child:
                  child)),
            ),
          );
        });
  }


  static void showSnack(context, message,{Color color=Colors.green,duration}) {
    var snackBar = SnackBar(
        duration: duration??const Duration(milliseconds: 3000),
        backgroundColor: color,
        content: Text(
          message,
          style: const TextStyle(color: Colors.white),
        ));

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static void openOkActionSheet({BuildContext? context, required message,okButtonText = "Ok", isCancelable= true,okClickListener}) {
    showModalBottomSheet<void>(
        context: context??MyApp.navigatorKey.currentContext!,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(size_30), topRight: Radius.circular(size_30)),
        ),
        builder: (BuildContext context) {
          return  WillPopScope(
            onWillPop: () async {
              return isCancelable;
            },
            child: Padding(
              padding:  EdgeInsets.all(size_24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding:  EdgeInsets.only(bottom: size_16),
                    child: Text(
                      message,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: MaterialButton(
                          padding: EdgeInsets.symmetric(
                            vertical: size_16,
                          ),
                          color: MyColors.appColor,
                          colorBrightness: Brightness.dark,
                          highlightElevation: 12,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(size_6)),
                          onPressed: () {
                            //startUpload();
                            Navigator.pop(context);
                            okClickListener();
                            //Do something
                          },
                          child: Text(
                            okButtonText,
                            style: Theme.of(context).textTheme.displaySmall!.copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size_24,
                  )
                ],
              ),
            ),
          );
        });

  }

  static void okBottomSheet({BuildContext? context, required message, isCancelable= true}) {
    showModalBottomSheet<void>(
        context: context??MyApp.navigatorKey.currentContext!,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(size_30), topRight: Radius.circular(size_30)),
        ),
        builder: (BuildContext context) {
          return WillPopScope(
              onWillPop: () async {
                return isCancelable;
              },
              child: SingleChildScrollView(
                child: Padding(
                  padding:  EdgeInsets.all(size_24),
                  child: !isCancelable
                      ? Text(
                    message,
                    textAlign: TextAlign.center,
                    style: MyTextStyle.kTextRegular,
                  )
                      : Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(bottom: size_24),
                        child:  Text(
                          message??"",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: size_14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      ElevatedCommonButton(title: "Ok",onPressed: (){
                        goBack();
                      },),
                      SizedBox(
                        height: size_12,
                      )
                    ],
                  ),
                ),
              ));
        });
  }


  static void showCustomDialog({required Widget widget , bool dismissible=true}) {
    showDialog(
        context: MyApp.navigatorKey.currentContext!,
        barrierDismissible: dismissible,
        builder: (_) => Material(
            type: MaterialType.transparency,
            child: Center(
              child: Container(
                margin: EdgeInsets.all(size_24),
                padding: EdgeInsets.all(size_24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(size_12),

                ),
                child: WillPopScope(
                    onWillPop: () {
                      return Future.value(dismissible);
                    },
                    child: widget),
              ),
            )));
  }

  static void showTwoActionDialog({String message ="",Widget? widget,bool dismissible=true,bool withIcon=false,String action1="CANCEL",Function? onClickAction1,String action2="CONFIRM", Function? onClickAction2 })
  {
    assert(message!="" || widget!=null);

    onClick(Function? onClick){
      goBack();
      if(onClick!=null){
        onClick();
      }
    }

    showDialog(

        context: MyApp.navigatorKey.currentContext!,
        barrierDismissible: false,
        builder: (_) => Material(
            type: MaterialType.transparency,
            child: Center(
              child: Container(
                margin: EdgeInsets.all(size_24),
                child: Stack(
                  children: [
                    BackdropFilter(
                      // blendMode: BlendMode.darken,
                      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(size_12),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: size_24,vertical: size_4),
                          decoration: BoxDecoration(
                            color: MyColors.kColorWhite,
                            borderRadius: BorderRadius.circular(size_12),

                          ),
                          child: WillPopScope(
                              onWillPop: () {
                                return Future.value(dismissible);
                              },
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  widget??Container(
                                      margin: EdgeInsets.symmetric(vertical: size_12),
                                      child: Text(message,textAlign: TextAlign.center,style: MyTextStyle.kTextMedium.copyWith(color: MyColors.kColorBlack,fontSize: size_14),)),
                                  getHorizontalLine(),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      MyTextButton(title: action1, onPress: ()=>onClick(onClickAction1)),
                                      SizedBox(width: size_6,),
                                      MyTextButton(title: action2, onPress: ()=>onClick(onClickAction2)),
                                      SizedBox(width: size_12,),
                                    ],
                                  ),
                                ],
                              )),
                        ),
                      ),
                    ),
                    if(withIcon)
                      Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          child: Center(
                            child: Container(
                              width: size_64,height: size_64,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(size_32),
                                  boxShadow:[ BoxShadow(
                                      offset: const Offset(5,5),
                                      color: MyColors.fillColor,
                                      blurRadius: 6
                                  )]
                              ),
                              child: Image.asset("assets/images/logo_big.png",),
                            ),
                          ))
                  ],
                ),
              ),
            )));
  }

  static void showAlertDialog({String title ="",Widget? body,bool dismissible=true,String buttonText="OK",Function? onButtonClick,})
  {
    assert(title!="" || body!=null);
    showDialog(
        context: MyApp.navigatorKey.currentContext!,
        barrierDismissible: dismissible,
        builder: (_) => Material(
            type: MaterialType.transparency,
            child: Center(
              child: Container(
                margin: EdgeInsets.all(size_24),
                padding: EdgeInsets.all(size_24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(size_12),

                ),
                child: WillPopScope(
                    onWillPop: () {
                      return Future.value(dismissible);
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if(title!="")
                          Container(
                            margin: EdgeInsets.symmetric(vertical: size_2),
                            child: Center(child: Text(title,style: MyTextStyle.kTextSemiBold.copyWith(fontSize: size_18),)),
                          ),
                        SizedBox(height: size_12,),
                        body??const SizedBox(),
                        SizedBox(height: size_24,),
                        ElevatedCommonButton(
                          width: size_120,
                          title: buttonText,
                          onPressed: (){
                            goBack();
                            if(onButtonClick!=null) {
                              onButtonClick();
                            }
                          },
                        )
                      ],
                    )),
              ),
            )));
  }

  static void showIconDialog({String message="",Widget? body,bool dismissible=true,String buttonText="OK",Function? onButtonClick,})
  {
    assert(body!=null || message!="");
    showDialog(
        context: MyApp.navigatorKey.currentContext!,
        barrierDismissible: dismissible,
        builder: (_) => Material(
            type: MaterialType.transparency,
            child: Center(
              child: Container(
                margin: EdgeInsets.all(size_24),
                child: Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.all(size_24),
                      margin: EdgeInsets.only(top: size_32),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(size_12),

                      ),
                      child: WillPopScope(
                          onWillPop: () {
                            return Future.value(dismissible);
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(height: size_24,),
                              message==""?(body??const SizedBox()):Text(message,style: MyTextStyle.kTextHint,),
                              SizedBox(height: size_24,),
                              ElevatedCommonButton(
                                width: size_120,
                                title: buttonText,
                                onPressed: (){
                                  goBack();
                                  if(onButtonClick!=null) {
                                    onButtonClick();
                                  }
                                },
                              )
                            ],
                          )),
                    ),
                    Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: Container(
                            width: size_64,height: size_64,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(size_24),
                                boxShadow:[ BoxShadow(
                                    offset: const Offset(5,5),
                                    color: MyColors.kColorBlack.shade200,
                                    blurRadius: 6
                                )]
                            ),
                            child: Image.asset("image/remove.png",),
                          ),
                        ))
                  ],
                ),
              ),
            )));
  }

  static Future<void> onLoadingAsync({BuildContext? ctx,bool dismissible = false}) async {
    await showDialog(
        context: ctx??MyApp.navigatorKey.currentContext!,
        barrierDismissible: dismissible,
        builder: (_) => Material(
            type: MaterialType.transparency,
            child: WillPopScope(
              onWillPop: () {
                return Future.value(dismissible);
              },
              child: Center(
                  child: Container(
                    padding: EdgeInsets.all(size_18),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(size_12),
                        color: MyColors.kColorWhite
                    ),
                    child: const CircularProgressIndicator(color: MyColors.appColor,),
                  )),
            )));
  }

}
