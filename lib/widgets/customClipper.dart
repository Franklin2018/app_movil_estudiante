import 'package:flutter/material.dart';

class ClipPainter extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var height = size.height;
    var width = size.width;
    var path = new Path();
    var yr = 0.25; // 25% ambos lados antes de la curva
    var radius = 20.0;
    path.lineTo(0, height - radius);
    path.arcToPoint(Offset(radius, height),
        radius: Radius.circular(radius), clockwise: false);
    path.lineTo(width * yr - radius, height);

    path.arcToPoint(Offset(width * yr, height - radius),
        radius: Radius.circular(radius), clockwise: false);
    var dif = width * 0.3;
    var controlPoint1 = Offset(dif, height - dif - radius);
    var controlPoint2 = Offset(width - dif, height - dif - radius);
    var secondEndPoint = Offset(width * yr * 3, height - radius);
    path.cubicTo(controlPoint1.dx, controlPoint1.dy, controlPoint2.dx,
        controlPoint2.dy, secondEndPoint.dx, secondEndPoint.dy);

    path.arcToPoint(
        Offset(
          width * 3 * yr + radius,
          height,
        ),
        radius: Radius.circular(radius),
        clockwise: false);
    path.lineTo(width - radius, height);
    path.arcToPoint(Offset(width, height - radius),
        radius: Radius.circular(radius), clockwise: false);
    path.lineTo(width, 0);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    
    return true;
  }
}
