import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart';
import '../../../../core/const/app_colors.dart';

class CustomArcPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = Rect.fromCircle(
      center: Offset(size.width / 2, size.height),
      radius: size.width *0.58,
    );
    LinearGradient gradientColor = LinearGradient(
      colors: [
        AppColors.secondary,
        AppColors.secondary20,
        AppColors.secondary0,
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );

    Paint activePaint = Paint()..shader = gradientColor.createShader(rect);

    activePaint.style = PaintingStyle.stroke;
    activePaint.strokeWidth = 15;
    activePaint.strokeCap = StrokeCap.round;

    Paint backgroundPaint = Paint();
    backgroundPaint.color = AppColors.gray30;
    backgroundPaint.style = PaintingStyle.stroke;
    backgroundPaint.strokeWidth = 15;
    backgroundPaint.strokeCap = StrokeCap.round;

    canvas.drawArc(rect, radians(135), radians(270), false, backgroundPaint);
    canvas.drawArc(rect, radians(135), radians(200), false, activePaint);
  }

  @override
  bool shouldRepaint(CustomArcPaint oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(CustomArcPaint oldDelegate) => false;
}
