import 'package:flutter/material.dart';

class CustomAppBarShape extends OutlinedBorder {
  // Implementing the constructor allows the CustomAppBarShape to be
  // properly compared when calling the `identical` method.
  const CustomAppBarShape({super.side});

  Path _getPath(Rect rect) {
    final Path path = Path();
    final double width = rect.width;
    final double height = rect.height * 0.4; // Adjust the depth of the wave

    path.lineTo(0, height * 8.7); // Move the start point lower

    final Offset controlPoint1 = Offset(width * 0.15, height * 6.2);
    final Offset endPoint1 = Offset(width * 0.6, height * 7.3);

    final Offset controlPoint2 = Offset(width * 0.8, height * 8.7);
    final Offset endPoint2 = Offset(width, height * 8.65);

    path.quadraticBezierTo(
        controlPoint1.dx, controlPoint1.dy, endPoint1.dx, endPoint1.dy);
    path.quadraticBezierTo(
        controlPoint2.dx, controlPoint2.dy, endPoint2.dx, endPoint2.dy);

    path.lineTo(width, 0);
    path.close();

    return path;
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return _getPath(rect.inflate(side.width));
  }

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return _getPath(rect);
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    if (rect.isEmpty) {
      return;
    }
    // Create a paint object with a gradient shader
    Paint fillPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment(-0.45, 1),
        end: Alignment(0.45, -1),
        colors: [Color(0xffFCBF49), Color(0xffF07F00)],
      ).createShader(rect);

    // Fill the shape with the gradient`
    canvas.drawPath(getOuterPath(rect), fillPaint);
    // canvas.drawPath(getOuterPath(rect, textDirection: textDirection), side.toPaint());
  }

  @override
  ShapeBorder scale(double t) {
    return CustomAppBarShape(side: side.scale(t));
  }

  @override
  OutlinedBorder copyWith({BorderSide? side}) {
    return CustomAppBarShape(side: side ?? this.side);
  }

  // The lerpFrom method is necessary for the CustomAppBarShape to be
  // properly animated when changing the AppBar shape and when
  // the AppBar is rebuilt.
  @override
  ShapeBorder? lerpFrom(ShapeBorder? a, double t) {
    if (a is CustomAppBarShape) {
      return CustomAppBarShape(side: BorderSide.lerp(a.side, side, t));
    }
    return super.lerpFrom(a, t);
  }

  // The lerpTo method is necessary for the CustomAppBarShape to be
  // properly animated when changing the AppBar shape and when
  // the AppBar is rebuilt.
  @override
  ShapeBorder? lerpTo(ShapeBorder? b, double t) {
    if (b is CustomAppBarShape) {
      return CustomAppBarShape(side: BorderSide.lerp(b.side, side, t));
    }
    return super.lerpTo(b, t);
  }
}
