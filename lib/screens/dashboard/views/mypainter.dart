import 'package:flutter/material.dart';

class MyPainter extends CustomPainter {
  final List<List<Offset>> strokes;

  MyPainter(this.strokes);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2.0; // Adjust stroke width as needed

    for (var stroke in strokes) {
      for (int i = 0; i < stroke.length - 1; i++) {
        canvas.drawLine(stroke[i], stroke[i + 1], paint);
      }
    }
  }

  @override
  bool shouldRepaint(MyPainter oldDelegate) => strokes != oldDelegate.strokes;

  // @override
  // void paint(Canvas canvas, Size size) {
  //   Paint paint = Paint()
  //     ..color = Colors.black
  //     ..strokeWidth = 2.0; // Adjust stroke width as needed

  //   for (int i = 0; i < points.length - 1; i++) {
  //     canvas.drawLine(points[i], points[i + 1], paint);
  //   }
  // }

  // @override
  // bool shouldRepaint(MyPainter oldDelegate) => points != oldDelegate.points;
}
