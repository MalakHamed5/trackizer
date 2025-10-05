// ignore_for_file: deprecated_member_use, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart';
import '../../../../core/const/app_colors.dart';

class ArcValueModel {
  final Color color;
  final double value;

  ArcValueModel({required this.color, required this.value});
}

class CustomArc180Paint extends CustomPainter {
  final double start;
  final double end;
  final double width;
  final double blurWidth;
  final double bgWidth;
  final double space;
  final List<ArcValueModel> drawArc;

  const CustomArc180Paint({
    required this.drawArc,
    this.space = 4,
    this.start = 0,
    this.end = 180,
    this.width = 20,
    this.bgWidth = 15,
    this.blurWidth = 6,
  });
  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = Rect.fromCircle(
      center: Offset(size.width / 2, size.height),
      radius: size.width / 2,
    );

    //--BACKGROUND
    Paint backgroundPaint = Paint();
    backgroundPaint.color = AppColors.gray30;
    backgroundPaint.style = PaintingStyle.stroke;
    backgroundPaint.strokeWidth = bgWidth;
    backgroundPaint.strokeCap = StrokeCap.round;

    var strVal = 180.0 + start;
    var drawStart = strVal;
    canvas.drawArc(rect, radians(strVal), radians(180), false, backgroundPaint);

    for (var arcObj in drawArc) {      //---ACIVE
      Paint activePaint = Paint();
      activePaint.color = arcObj.color;
      activePaint.style = PaintingStyle.stroke;
      activePaint.strokeWidth = width;
      activePaint.strokeCap = StrokeCap.round;

      //---SHADOW
      Paint shadowPaint = Paint()
        ..style = PaintingStyle.stroke
        ..color = AppColors.secondary.withOpacity(0.3)
        ..strokeWidth = width + blurWidth
        ..maskFilter = MaskFilter.blur(BlurStyle.normal, 5);
      // -- Drow Shadow Arc
      Path path = Path();
      path.addArc(rect, radians(drawStart), radians(arcObj.value -space));

      canvas.drawPath(path, shadowPaint);
      canvas.drawArc(rect, radians(drawStart), radians(arcObj.value -space), false, activePaint);

      drawStart = drawStart+ arcObj.value + space; 
    }
  }

  @override
  bool shouldRepaint(CustomArc180Paint oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(CustomArc180Paint oldDelegate) => false;
}
