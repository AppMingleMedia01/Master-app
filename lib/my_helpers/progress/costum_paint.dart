




import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart' as vmath;

import '../MyTheme/my_theme.dart';



class CustomProgressPainter extends CustomPainter {
  double value= 100;
  double maxValue = 360;
  double canvasWidth = 220;
  CustomProgressPainter({this.value = 0, this.canvasWidth = 220});

  double get pieValue => (360 * value) / 100;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    canvas.drawCircle(
      center,
      (canvasWidth-50) / 2,
      Paint()
        ..style = PaintingStyle.stroke
        ..color = MyColors.kColorWhite.shade200
        ..strokeWidth = 2,
    );
    canvas.saveLayer(
      Rect.fromCenter(center: center, width: canvasWidth, height: canvasWidth),
      // Paint()..blendMode = BlendMode.dstIn,
      Paint(),
    );
    canvas.drawArc(
      Rect.fromCenter(center: center, width: canvasWidth-50, height: canvasWidth -50),
      vmath.radians(-90),
      vmath.radians(pieValue),
      false,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round
        ..color = MyColors.kColorWhite.shade900
        ..strokeWidth = 2,
    );

    canvas.drawArc(
      Rect.fromCenter(center: center, width: canvasWidth - 60 , height: canvasWidth-60),
      vmath.radians(-90),
      vmath.radians(maxValue),
      false,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round
        ..color = MyColors.kColorWhite.shade900
        ..strokeWidth = 2
        ..blendMode = BlendMode.srcIn,
    );
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}