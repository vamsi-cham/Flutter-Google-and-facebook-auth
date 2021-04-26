import 'dart:ui';

import 'package:flutter/material.dart';

class Point {
  final double x;
  final double y;

  Point(this.x, this.y);
}

class BackgroundPainter extends CustomPainter {

  final Paint bluePaint;

  BackgroundPainter()
      : bluePaint = Paint()
          ..color = Colors.purple.shade300
          ..style = PaintingStyle.fill;


  void _addPointsToPath(Path path, List<Point> points) {
    if (points.length < 3) {
      throw UnsupportedError('Need three or more points to create a path.');
    }

    for (var i = 0; i < points.length - 2; i++) {
      final xc = (points[i].x + points[i + 1].x) / 2;
      final yc = (points[i].y + points[i + 1].y) / 2;
      path.quadraticBezierTo(points[i].x, points[i].y, xc, yc);
    }

    // connect the last two points
    path.quadraticBezierTo(
      points[points.length - 2].x,
      points[points.length - 2].y,
      points[points.length - 1].x,
      points[points.length - 1].y,
    );
  }

  @override
  void paint(Canvas canvas, Size size) {
    paintBlue(size, canvas);

  }

  void paintBlue(Size size, Canvas canvas) {
    final path = Path();

    path.moveTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    _addPointsToPath(path, [
      Point(
        lerpDouble(0, size.width / 3, 1),
        lerpDouble(0, size.height / 3, 1),
      ),
      Point(
        lerpDouble(size.width / 2, size.height * 0.5, 1),
        lerpDouble(size.width / 2, size.height, 0.5),
      ),
      Point(
        size.width,
        lerpDouble(size.width, size.height, 0.1),
      ),
    ]);
    canvas.drawPath(path, bluePaint);
  }
 @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
