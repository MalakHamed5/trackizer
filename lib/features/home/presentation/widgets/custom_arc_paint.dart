import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart';
import '../../../../core/const/app_colors.dart';

class CustomArcPaint extends CustomPainter {
  final double start;
  final double end;
  final double width;
  final double blurWidth;

  const CustomArcPaint({
    this.start = 0,
    this.end = 270,
    this.width = 15,
    this.blurWidth = 6,
  });
  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = Rect.fromCircle(
      center: Offset(size.width / 2, size.height),
      radius: size.width * 0.58,
    );
    LinearGradient gradientColor = const LinearGradient(
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
    activePaint.strokeWidth = width;
    activePaint.strokeCap = StrokeCap.round;

    Paint backgroundPaint = Paint();
    backgroundPaint.color = AppColors.gray30;
    backgroundPaint.style = PaintingStyle.stroke;
    backgroundPaint.strokeWidth = width;
    backgroundPaint.strokeCap = StrokeCap.round;

    Paint shadowPaint = Paint()
      ..color = AppColors.secondary.withOpacity(0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = width + blurWidth
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 5);

    var strVal = 135.0 + start;

    canvas.drawArc(rect, radians(strVal), radians(270), false, backgroundPaint);

    //Draw Shadow arch
    Path path = Path();
    path.addArc(rect, radians(strVal), radians(end));

    canvas.drawPath(path, shadowPaint);
    canvas.drawArc(rect, radians(strVal), radians(end), false, activePaint);
  }

  @override
  bool shouldRepaint(CustomArcPaint oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(CustomArcPaint oldDelegate) => false;
}
