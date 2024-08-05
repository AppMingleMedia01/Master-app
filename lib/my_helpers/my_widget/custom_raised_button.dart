import 'package:flutter/material.dart';

import '../MyTheme/my_theme.dart';

class  ElevatedCommonButton extends StatelessWidget {
  final Widget? child;
  final String? title;
  final Color? color;
  final EdgeInsets? margin;
  final double? height;
  final double? width;
  final TextStyle? textStyle;
  final double? elevation;
  final double? borderRadius;
  final VoidCallback? onPressed;

  const ElevatedCommonButton({super.key,
    this.color,
    this.borderRadius,
    this.height,
    this.elevation,
    this.width=double.infinity,
    this.onPressed,
    this.margin,
    this.child,
    this.title,
    this.textStyle,
  }):assert(title!=null || child!=null);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin??EdgeInsets.only(left: size_12,right: size_12),
      child: SizedBox(
        height: height??size_48,
        width: width,
        child: ElevatedButton(
          style: ButtonStyle(
            padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: size_5,vertical: size_0)),
            elevation: MaterialStateProperty.all(elevation??2),
            backgroundColor: onPressed==null?MaterialStateProperty.all<Color?>(MyColors.kColorBg1):MaterialStateProperty.all<Color?>(color??MyColors.kColorBg1),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(borderRadius??size_20)))),
          ),
          onPressed: onPressed,
          child: child??Text("$title",
            textAlign: TextAlign.center,
            style: textStyle??MyTextStyle.kTextMedium.copyWith(color: onPressed==null?Colors.white38:Colors.white,fontSize: size_18),),
        ),
      ),
    );
  }
}

class OutlineButton extends StatelessWidget {
  final Widget? child;
  final Widget? iconWidget;
  final String? title;
  final Color? color;
  final EdgeInsets? margin;
  final double? height;
  final double? width;
  final double? borderRadius;
  final TextStyle? textStyle;
  final VoidCallback? onPressed;

  const OutlineButton({super.key,
    this.iconWidget,
    this.color,
    this.borderRadius,
    this.height,
    this.width=double.infinity,
    this.onPressed,
    this.margin,
    this.child,
    this.title,
    this.textStyle,
  }):assert(title!=null || child!=null);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height??size_48,
      width: width,
      margin: margin??EdgeInsets.only(left: size_12,right: size_12),
      child: ElevatedButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: size_8,vertical: size_0)),
          elevation: MaterialStateProperty.all(0),
          backgroundColor: MaterialStateProperty.all<Color?>(MyColors.transparent),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              side: BorderSide(color: onPressed==null?MyColors.kColorWhite.shade500:(color??MyColors.secondaryAppColor)),
              borderRadius: BorderRadius.all(Radius.circular(borderRadius??size_6)))),
        ),
        onPressed: onPressed,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: size_6),
          child: Row(
            mainAxisAlignment: iconWidget!=null?MainAxisAlignment.spaceBetween:MainAxisAlignment.center,
            children: [
              child??Text("$title",
                textAlign: TextAlign.center,
                style:textStyle?? MyTextStyle.kTextBold.copyWith(color: onPressed==null?MyColors.kColorWhite.shade500:(color??MyColors.secondaryAppColor)),),
              if(iconWidget!=null)
                iconWidget!
            ],
          ),
        ),
      ),
    );
  }
}

class ButtonProgress extends StatelessWidget {
  final Widget? child;
  final Widget? iconWidget;
  final String? title;
  final Color? color;
  final EdgeInsets? margin;
  final double? height;
  final double? width;
  final double? borderRadius;
  final TextStyle? textStyle;
  final VoidCallback? onPressed;

  const ButtonProgress({super.key,
    this.iconWidget,
    this.color,
    this.borderRadius,
    this.height,
    this.width=double.infinity,
    this.onPressed,
    this.margin,
    this.child,
    this.title,
    this.textStyle,
  }):assert(title!=null || child!=null);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height??size_48,
      width: width,
      margin: margin??EdgeInsets.only(left: size_12,right: size_12),
      child: ElevatedButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: size_8,vertical: size_0)),
          elevation: MaterialStateProperty.all(0),
          backgroundColor: MaterialStateProperty.all<Color?>(MyColors.transparent),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              side: BorderSide(color: onPressed==null?MyColors.kColorWhite.shade500:(color??MyColors.kColorWhite)),
              borderRadius: BorderRadius.all(Radius.circular(borderRadius??size_12)))),
        ),
        onPressed: onPressed,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: size_6),
          child: Row(
            mainAxisAlignment: iconWidget!=null?MainAxisAlignment.spaceBetween:MainAxisAlignment.center,
            children: [
              child??Text("$title",
                textAlign: TextAlign.center,
                style:textStyle?? MyTextStyle.kTextBold.copyWith(color: onPressed==null?MyColors.kColorWhite.shade500:(color??MyColors.kColorWhite)),),
              if(iconWidget!=null)
                iconWidget!
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: non_constant_identifier_names
Widget MyTextButton({@required title,@required onPress,TextStyle? textStyle,EdgeInsets? padding})
{
  assert(title!=null);
  return  InkWell(
    onTap: onPress,
    child: Container(
        padding:padding??EdgeInsets.all(size_12),
        child: Text(title, style: textStyle??MyTextStyle.kTextMedium.copyWith(color: MyColors.kColorBlack,fontSize: size_14))),
  );
}